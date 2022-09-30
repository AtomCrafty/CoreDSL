package com.minres.coredsl.scoping

import com.minres.coredsl.coreDsl.CastExpression
import com.minres.coredsl.coreDsl.CompoundStatement
import com.minres.coredsl.coreDsl.CoreDef
import com.minres.coredsl.coreDsl.CoreDslPackage
import com.minres.coredsl.coreDsl.Declaration
import com.minres.coredsl.coreDsl.DeclarationStatement
import com.minres.coredsl.coreDsl.Declarator
import com.minres.coredsl.coreDsl.DeclaratorReference
import com.minres.coredsl.coreDsl.DescriptionContent
import com.minres.coredsl.coreDsl.EnumTypeDeclaration
import com.minres.coredsl.coreDsl.Expression
import com.minres.coredsl.coreDsl.ForLoop
import com.minres.coredsl.coreDsl.FunctionCallExpression
import com.minres.coredsl.coreDsl.FunctionDefinition
import com.minres.coredsl.coreDsl.ISA
import com.minres.coredsl.coreDsl.Instruction
import com.minres.coredsl.coreDsl.InstructionSet
import com.minres.coredsl.coreDsl.IntrinsicExpression
import com.minres.coredsl.coreDsl.MemberAccessExpression
import com.minres.coredsl.coreDsl.ParenthesisExpression
import com.minres.coredsl.coreDsl.StructTypeDeclaration
import com.minres.coredsl.coreDsl.StructTypeSpecifier
import com.minres.coredsl.coreDsl.TypeSpecifier
import com.minres.coredsl.coreDsl.UnionTypeDeclaration
import com.minres.coredsl.coreDsl.UnionTypeSpecifier
import com.minres.coredsl.coreDsl.UserTypeDeclaration
import java.util.HashSet
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.scoping.IScope
import org.eclipse.xtext.scoping.Scopes

import static extension com.minres.coredsl.util.ModelExtensions.*

class CoreDslScopeProvider extends AbstractCoreDslScopeProvider {
// Possible references:
//   InstructionSet.superType
//   CoreDef.providedInstructionSets
//   StructTypeSpecifier.target
//   UnionTypeSpecifier.target
//   EnumTypeSpecifier.target
//   MemberAccessExpression.declarator
//   EntityReference.target
	override IScope getScope(EObject context, EReference reference) {

		//println('''Trying to resolve «reference.EType.name» «(reference.eContainer as org.eclipse.emf.ecore.EClass).name».«reference.name» on «context.eClass.name»''');

		switch (reference) {
			case CoreDslPackage.Literals.CORE_DEF__PROVIDED_INSTRUCTION_SETS,
			case CoreDslPackage.Literals.INSTRUCTION_SET__SUPER_TYPE: {
				return getIsaScope(context, reference);
			}
			case CoreDslPackage.Literals.STRUCT_TYPE_SPECIFIER__TARGET: {
				return getStructTypeScope(context);
			}
			case CoreDslPackage.Literals.UNION_TYPE_SPECIFIER__TARGET: {
				return getUnionTypeScope(context);
			}
			case CoreDslPackage.Literals.ENUM_TYPE_SPECIFIER__TARGET: {
				return getEnumTypeScope(context);
			}
			case CoreDslPackage.Literals.MEMBER_ACCESS_EXPRESSION__DECLARATOR: {
				return getMemberScope(context);
			}
			case CoreDslPackage.Literals.DECLARATOR_REFERENCE__TARGET: {
				return getDeclaratorScope(context, null);
			}
		}

		return IScope.NULLSCOPE;
	}

	def private IScope getIsaScope(EObject context, EReference reference) {
		val importedScope = super.getScope(context, reference);
		val description = context.ancestorOfTypeOrSelf(DescriptionContent);
		return Scopes.scopeFor(description.definitions.filter(InstructionSet), importedScope);
	}

	def private static Iterable<UserTypeDeclaration> getTypeScope(EObject context) {
		return context.ancestorOfTypeOrSelf(ISA).elaborationOrder.flatMap[it.types];
	}

	def private static IScope getStructTypeScope(EObject context) {
		return Scopes.scopeFor(getTypeScope(context).filter(StructTypeDeclaration));
	}

	def private static IScope getUnionTypeScope(EObject context) {
		return Scopes.scopeFor(getTypeScope(context).filter(UnionTypeDeclaration));
	}

	def private static IScope getEnumTypeScope(EObject context) {
		return Scopes.scopeFor(getTypeScope(context).filter(EnumTypeDeclaration));
	}

	/**
	 * Finds the type specifier determining the type of the expression, if such a specifier exists.
	 * Applicable to declarator references, member accesses, function calls and type casts.
	 * */
	def private static TypeSpecifier findTypeSpecifier(Expression expression) {
		switch (expression) {
			ParenthesisExpression: {
				return findTypeSpecifier(expression.inner);
			}
			DeclaratorReference: {
				val declarator = expression.getTarget.castOrNull(Declarator);
				return declarator?.type;
			}
			MemberAccessExpression: {
				val declarator = expression.declarator;
				return declarator?.type;
			}
			FunctionCallExpression: {
				val function = expression.target.castOrNull(FunctionDefinition);
				return function?.returnType;
			}
			CastExpression: {
				return expression.targetType;
			}
		}
	}

	/**
	 * Returns the members of the specified type, or null if it is not a composite type
	 */
	def private static Iterable<Declarator> getTypeMembers(TypeSpecifier typeSpecifier) {
		switch (typeSpecifier) {
			StructTypeSpecifier: {
				val typeDeclaration = typeSpecifier.target;
				if(typeDeclaration === null) return null;

				return typeDeclaration.members.flatMap[it.declarators];
			}
			UnionTypeSpecifier: {
				val typeDeclaration = typeSpecifier.target;
				if(typeDeclaration === null) return null

				return typeDeclaration.members.flatMap[it.declarators];
			}
			default: {
				return null;
			}
		}
	}

	def private static IScope getTypeMemberScope(TypeSpecifier typeSpecifier) {
		val members = getTypeMembers(typeSpecifier);
		return members !== null ? Scopes.scopeFor(members) : IScope.NULLSCOPE;
	}

	def private static IScope getMemberScope(EObject context) {
		val memberAccess = context.castOrNull(MemberAccessExpression);
		if(memberAccess === null) return IScope.NULLSCOPE;

		val typeSpecifier = findTypeSpecifier(memberAccess.target);
		if(typeSpecifier === null) return IScope.NULLSCOPE;

		return getTypeMemberScope(typeSpecifier);
	}

	def private static IScope getParentDeclaratorScope(EObject context) {
		return getDeclaratorScope(context.eContainer, context);
	}

	def private static dispatch IScope getDeclaratorScope(ForLoop context, EObject child) {
		if(child !== null && child.eContainingFeature === CoreDslPackage.Literals.FOR_LOOP__START_DECLARATION) {
			return getParentDeclaratorScope(context);
		}

		if(context.startDeclaration !== null) {
			return Scopes.scopeFor(context.startDeclaration.declarators, getParentDeclaratorScope(context));
		} else {
			return Scopes.scopeFor(#[], getParentDeclaratorScope(context));
		}
	}

	def private static dispatch IScope getDeclaratorScope(Declaration context, EObject child) {
		return Scopes.scopeFor(context.declarators.takeWhile[it !== child], getParentDeclaratorScope(context));
	}

	def private static Iterable<Declarator> getDeclarationsTransitive(InstructionSet iset) {
		return getDeclarationsTransitive(iset, new HashSet());
	}

	def private static Iterable<Declarator> getDeclarationsTransitive(InstructionSet isa,
		HashSet<InstructionSet> seen) {
		if(!seen.add(isa)) return #[]; // recursion error
		
		val declarations = isa.archStateBody.filter(DeclarationStatement).flatMap[it.declaration.declarators];
		val enumMembers = isa.types.filter(EnumTypeDeclaration).flatMap[it.members];
		val functions = isa.functions.map[it.declarator];
		
		val entities = declarations + enumMembers + functions;
		return isa.superType !== null ? entities + getDeclarationsTransitive(isa.superType) : entities;
	}

	def private static dispatch IScope getInheritedScope(CoreDef core) {
		val declarations = core.providedInstructionSets.flatMap[getDeclarationsTransitive(it)];
		val seen = new HashSet();
		return Scopes.scopeFor(declarations.filter[seen.add(it)]);
	}

	def private static dispatch IScope getInheritedScope(InstructionSet iset) {
		if(iset.superType === null) return IScope.NULLSCOPE;
		Scopes.scopeFor(getDeclarationsTransitive(iset.superType))
	}

	def private static dispatch IScope getDeclaratorScope(ISA context, EObject child) {
		val declarations = context.archStateBody //
		.takeWhile[it !== child] //
		.filter(DeclarationStatement) //
		.flatMap[it.declaration.declarators];
		val enumMembers = context.types.filter(EnumTypeDeclaration).flatMap[it.members];
		return Scopes.scopeFor(declarations + enumMembers + context.functions, getInheritedScope(context));
	}

	def private static dispatch IScope getDeclaratorScope(CompoundStatement context, EObject child) {
		val newDeclarations = context.statements //
		.takeWhile[it !== child] //
		.filter(DeclarationStatement) //
		.flatMap[it.declaration.declarators];
		return Scopes.scopeFor(newDeclarations, getParentDeclaratorScope(context));
	}

	def private static dispatch IScope getDeclaratorScope(FunctionDefinition context, EObject child) {
		return Scopes.scopeFor(context.parameters.flatMap[it.declarators], getParentDeclaratorScope(context));
	}

	def private static dispatch IScope getDeclaratorScope(Instruction context, EObject child) {
		return Scopes.scopeFor(context.operands.flatMap[it.declarators], getParentDeclaratorScope(context));
	}

	def private static dispatch IScope getDeclaratorScope(IntrinsicExpression context, EObject child) {
		if((context.function == 'offsetof' || context.function == 'bitoffsetof') && context.arguments.size == 2 && child === context.arguments.get(1)) {
			val arg1 = context.arguments.get(0);
			val arg2 = context.arguments.get(1);
			if(arg2 instanceof DeclaratorReference) {
				switch (arg1) {
					Expression: {
						val typeSpecifier = findTypeSpecifier(arg1);
						if(typeSpecifier === null) return IScope.NULLSCOPE;

						return getTypeMemberScope(typeSpecifier);
					}
					TypeSpecifier: {
						return getTypeMemberScope(arg1);
					}
				}
			}
			return IScope.NULLSCOPE;
		}
		return getParentDeclaratorScope(context);
	}

	def private static dispatch IScope getDeclaratorScope(EObject context, EObject child) {
		return getParentDeclaratorScope(context);
	}
}
