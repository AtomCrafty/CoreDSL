/*
 * generated by Xtext 2.10.0
 */
package com.minres.coredsl.scoping

import com.minres.coredsl.coreDsl.BitField
import com.minres.coredsl.coreDsl.BlockItem
import com.minres.coredsl.coreDsl.CompositeTypeSpecifier
import com.minres.coredsl.coreDsl.CompoundStatement
import com.minres.coredsl.coreDsl.CoreDef
import com.minres.coredsl.coreDsl.CoreDslPackage
import com.minres.coredsl.coreDsl.Declaration
import com.minres.coredsl.coreDsl.DirectDeclarator
import com.minres.coredsl.coreDsl.FunctionDefinition
import com.minres.coredsl.coreDsl.ISA
import com.minres.coredsl.coreDsl.Instruction
import com.minres.coredsl.coreDsl.InstructionSet
import com.minres.coredsl.coreDsl.IterationStatement
import com.minres.coredsl.coreDsl.Postfix
import com.minres.coredsl.coreDsl.PostfixExpression
import com.minres.coredsl.coreDsl.PrimaryExpression
import com.minres.coredsl.coreDsl.StructFieldDeclaration
import com.minres.coredsl.coreDsl.Variable
import java.util.List
import java.util.Set
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.xtext.scoping.IScope
import org.eclipse.xtext.scoping.Scopes

import static extension com.minres.coredsl.util.ModelUtil.*

/**
 * This class contains custom scoping description.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class CoreDslScopeProvider extends AbstractCoreDslScopeProvider {

    override IScope getScope(EObject context, EReference reference){
        //println("scopre for "+reference.name+"(class "+reference.EReferenceType.name+") in context "+context.eClass.name)
        if(reference.EReferenceType == CoreDslPackage.Literals.VARIABLE) {
            switch(context){
                PrimaryExpression:
                    context.containingStatement.scopeForVariable(reference)
                BlockItem:
                    context.scopeForVariable(reference)
                InstructionSet:
                    Scopes.scopeFor(context.variables, context.superType !== null? context.superType.scopeForVariable(reference) : IScope.NULLSCOPE)
                CoreDef:
                    Scopes.scopeFor(context.variables, context.contributingType.outerScope)
                default:
                    super.getScope(context, reference)
            }
        } else if(reference.EReferenceType == CoreDslPackage.Literals.DIRECT_DECLARATOR) {
            val parent = context.eContainer
            if(parent instanceof PostfixExpression) {
                val type = (parent.directDeclarator .eContainer.eContainer as Declaration).type
                if( type instanceof CompositeTypeSpecifier) {
                    val decls = type.directDeclarations;
                    return Scopes.scopeFor(decls)
                }                
            } else if(parent instanceof Postfix) {
                if(parent.declarator !== null){
                    val decl = parent.declarator.eContainer
                    if(decl instanceof StructFieldDeclaration){
                        if( decl.specifier.type instanceof CompositeTypeSpecifier) {
                            val decls = decl.specifier.type.directDeclarations;
                            return Scopes.scopeFor(decls)
                        }                
                    }
                } else {
                    return parent.getScope(reference);
                }
            }
            IScope.NULLSCOPE            
        } else
            super.getScope(context, reference)
    }
    
    def BlockItem containingStatement(EObject obj){
        if(obj instanceof BlockItem)
            return obj
        else if(obj.eContainer !== null)
            obj.eContainer.containingStatement
        else 
            null
    }

    def IScope scopeForVariable(InstructionSet isa, EReference reference) {
        Scopes.scopeFor(isa.variables, isa.superType !== null? isa.superType.scopeForVariable(reference) : IScope.NULLSCOPE)
    }

    def IScope scopeForVariable(CoreDef coreDef, EReference reference) {
        Scopes.scopeFor(coreDef.variables, coreDef.contributingType.outerScope)
    }

    def IScope scopeForVariable(BlockItem context, EReference reference) {
        val parent = context.eContainer
        val parentScope = switch (parent) {
            CompoundStatement:
                Scopes.scopeFor(parent.variablesDeclaredBefore(context), parent.scopeForVariable(reference))
            Instruction:
                Scopes.scopeFor(EcoreUtil2.getAllContentsOfType(parent, BitField),
                    parent.parentOfType(ISA).getScope(reference))
            FunctionDefinition:
                Scopes.scopeFor(EcoreUtil2.getAllContentsOfType(parent, DirectDeclarator),
                    parent.parentOfType(ISA).getScope(reference))
            default:
                parent.getScope(reference)
        }
        if (context instanceof IterationStatement)
            if (context.startDecl !== null)
                return Scopes.scopeFor(context.startDecl.init.map[it.declarator], parentScope)
        return parentScope
    }

    private def IScope outerScope(List<InstructionSet> isas) {
    	val Set<String> seen = newHashSet
        val declsList = isas.map[
        	it.variablesList((seen))
        ].flatten.filter[it.size>0].toList
        declsList.asScopes
    }
		
	def IScope asScopes(Iterable<Iterable<Variable>> list){
		if(list.empty)
			IScope.NULLSCOPE
		else
			Scopes.scopeFor(list.last, list.take(list.size-1).asScopes)
	}
		
    private def Iterable<Variable> variables(ISA isa) {
        #[isa.stateDeclarations].filter[it !== null].map [
            it.flatMap[init].flatMap[EcoreUtil2.getAllContentsOfType(it, DirectDeclarator)]
        ].flatten + isa.functions
    }

		
	def List<Iterable<Variable>> variablesList(InstructionSet isa, Set<String> seen){
		seen.add(isa.name)
		if(isa.superType !== null && !seen.contains(isa.superType.name)) {
			val ret = isa.superType.variablesList(seen)
			ret.add(isa.variables)
			return ret
		} else
			newLinkedList(isa.variables)
	}

    /************************************************************************
     * declarationsBefore extension methods begin
     */
    def Iterable<Declaration> declarationsBefore(EObject object, BlockItem decl){
        switch (object) {
            CompoundStatement:
                object.items.takeWhile [
                    it !== decl
                ].filter[it instanceof Declaration].map[it as Declaration]
            InstructionSet:
                object.allDeclarations.takeWhile[it!==decl]
            CoreDef:
                object.allDeclarations.takeWhile[it!==decl]
            default:
                #[]
        }
    }
    /*
     * declarationsBefore extension methods end
     ************************************************************************/

    /************************************************************************
     * directDeclarations extension methods begin
     */
    def Iterable<Declaration> allDeclarations(ISA isa) {
        if(isa instanceof InstructionSet) {
            val declsSuper = isa.superType!==null?isa.superType.allDeclarations:#[]
            #[declsSuper, isa.stateDeclarations.filter[it instanceof Declaration]].flatten
        } else if(isa instanceof CoreDef){
            val declsSuper = isa.contributingType.map[it.allDeclarations].flatten
            #[declsSuper, isa.stateDeclarations.filter[it instanceof Declaration]].flatten
        }
    }
    /*
     * directDeclarations extension methods end
     ************************************************************************/

    /************************************************************************
     * directDeclarations extension methods begin
     */

    def Iterable<DirectDeclarator> variablesDeclaredBefore(EObject stmt, EObject o) {
        if(o instanceof BlockItem)
            stmt.declarationsBefore(o).flatMap[
                it.init.map[it.declarator]
            ]
        else
            #[]
    }
    /*
     * directDeclarations extension methods end
     ************************************************************************/

    /************************************************************************
     * directDeclarations extension methods begin
     */
    def dispatch Iterable<DirectDeclarator> directDeclarations(Iterable<StructFieldDeclaration> decls) {
        decls.map[it.declarator].flatten
    }

    def dispatch Iterable<DirectDeclarator> directDeclarations(Declaration decl) {
        decl.init.map[it.declarator]
    }

    def dispatch Iterable<DirectDeclarator> directDeclarations(CompositeTypeSpecifier spec) {
        if (spec.declaration.size > 0)
            spec.declaration.directDeclarations
        else {
            val specifier = spec.eContainer.findCompositeTypeSpecifier([
                CompositeTypeSpecifier d|d.name!==null?d.name==spec.name:false
            ])
            specifier===null?#[]:specifier.declaration.directDeclarations
        }
    }
    
    def dispatch Iterable<DirectDeclarator> directDeclarations(EObject decl) {
        #[]
    }
    /*
     * directDeclarations extension methods end
     ************************************************************************/

    /************************************************************************
     * type extension methods begin
     */
    def dispatch CompositeTypeSpecifier findCompositeTypeSpecifier(Declaration object, (CompositeTypeSpecifier)=>boolean predicate){
        val res = object.eContainer.declarationsBefore(object)
            .map[it.type]
            .filter[it instanceof CompositeTypeSpecifier]
            .map[it as CompositeTypeSpecifier]
            .findFirst(predicate)
        res ?: object.eContainer.eContainer.findCompositeTypeSpecifier(predicate)
    }
        
    def dispatch CompositeTypeSpecifier findCompositeTypeSpecifier(ISA isa, (CompositeTypeSpecifier)=>boolean predicate){
        isa.allDeclarations
            .map[it.type]
            .filter[it instanceof CompositeTypeSpecifier]
            .map[it as CompositeTypeSpecifier]
            .findFirst(predicate)
    }

    def dispatch CompositeTypeSpecifier findCompositeTypeSpecifier(EObject object, (CompositeTypeSpecifier)=>boolean predicate){
        object.eContainer.findCompositeTypeSpecifier(predicate)
    }
    /*
     * type extension methods end
     ************************************************************************/
    
    /************************************************************************
     * directDeclarator extension methods begin
     */
    def dispatch DirectDeclarator directDeclarator(PrimaryExpression expression) {
        expression.ref instanceof DirectDeclarator? expression.ref as DirectDeclarator : null
    }

    def dispatch DirectDeclarator directDeclarator(Postfix expression) {
        expression.declarator
    }

    def dispatch DirectDeclarator directDeclarator(PostfixExpression expression) {
        expression.left.directDeclarator
    }

    def dispatch DirectDeclarator directDeclarator(EObject object) {
        // dummy implementation as fall back
        println("No implementation of getDeclaration() for " + object.class)
        null
    }
    /*
     * directDeclarator extension methods end
     ************************************************************************/
}
