/*
 * generated by Xtext 2.10.0
 */
package com.minres.coredsl.tests

import com.google.inject.Inject
import com.minres.coredsl.coreDsl.DescriptionContent
import com.minres.coredsl.coreDsl.InstructionSet
import java.io.FileReader
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.junit.jupiter.api.Assertions.assertNull

import static extension com.google.common.io.CharStreams.*

@ExtendWith(InjectionExtension)
@InjectWith(CoreDslInjectorProvider)
class CoreDslLoadTest {

	@Inject extension ParseHelper<DescriptionContent> parseHelper

    @Inject ValidationTestHelper validator

	@Test
	def void loadSimpleModel() {
		val content = new FileReader('inputs/isa_1.core_desc').readLines.join('\n').parse
        validator.assertNoErrors(content)
				
		val InstructionSet result = content.definitions.get(0) as InstructionSet
		assertNotNull(result)
		assertEquals("RV32I", result.name)
		assertNull(result.superType)
		assertEquals(7, result.declarations.size())
		assertNotNull(result.instructions)

		assertEquals(5, result.instructions.size)
		val i0 = result.instructions.get(0);
		assertEquals("ADDI", i0.name)
		assertEquals(5, i0.encoding.fields.size)

		val i1 = result.instructions.get(1);
		assertEquals("SLTI", i1.name)
		assertEquals(5, i1.encoding.fields.size)

		val i2 = result.instructions.get(2);
		assertEquals("SLTIU", i2.name)
		assertEquals(5, i2.encoding.fields.size)

		val i3 = result.instructions.get(3);
		assertEquals("SW", i3.name)
		assertEquals(6, i3.encoding.fields.size)

	}


	@Test
	def void loadSqrt() {
        val content = new FileReader('inputs/sqrt.core_desc').readLines.join('\n').parse
        validator.assertNoErrors(content)
		
		val InstructionSet instructionSet = content.definitions.get(0) as InstructionSet
		assertNotNull(instructionSet)
		assertEquals("Vec2D", instructionSet.name)
	}
	
	@Test
	def void loadSine(){
        val content = new FileReader('inputs/sine.core_desc').readLines.join('\n').parse
        validator.assertNoErrors(content)
		
		val InstructionSet instructionSet = content.definitions.get(0) as InstructionSet
		assertNotNull(instructionSet)
		assertEquals("RISCVROB", instructionSet.name)
	}
}
