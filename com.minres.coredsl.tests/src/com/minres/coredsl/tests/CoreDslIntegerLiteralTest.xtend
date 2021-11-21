/*
 * generated by Xtext 2.10.0
 */
package com.minres.coredsl.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

import static org.junit.Assert.assertTrue
import static org.junit.Assert.assertEquals
import static org.junit.Assert.assertNotNull
import com.minres.coredsl.tests.util.TestHelper
import java.math.BigInteger
import com.minres.coredsl.util.TypedBigInteger

@ExtendWith(InjectionExtension)
@InjectWith(CoreDslInjectorProvider)
class CoreDslIntegerLiteralTest {

	@Inject ValidationTestHelper validator
	@Inject extension TestHelper helper

	def validateIntegerLiteral(String source, int expectedValue, int expectedBitSize, boolean expectedSigned) {
		val constant = source.parseAsIntegerConstant()

		val issues = validator.validate(constant)
		for (iss : issues)
			println(iss)

		assertTrue(issues.empty)

		val value = constant.value as TypedBigInteger
		val type = value.type

		assertNotNull(type)
		assertEquals(BigInteger.valueOf(expectedValue), value)
		assertEquals(expectedBitSize, type.bitSize)
		assertEquals(expectedSigned, type.signed)
	}

	@Test
	def void verilogUnsigned() {
		validateIntegerLiteral("0'b0", 0, 0, false)
		validateIntegerLiteral("1'b1", 1, 1, false)
		validateIntegerLiteral("5'b10", 2, 5, false)
		
		validateIntegerLiteral("32'd12345", 12345, 32, false)
		validateIntegerLiteral("32'd67890", 67890, 32, false)
		
		// xtend doesn't have octal literals
		validateIntegerLiteral("32'o1234", 668, 32, false)
		validateIntegerLiteral("32'o5670", 3000, 32, false)
		
		validateIntegerLiteral("32'h1234", 0x1234, 32, false)
		validateIntegerLiteral("32'h5678", 0x5678, 32, false)
		validateIntegerLiteral("32'h90AB", 0x90AB, 32, false)
		validateIntegerLiteral("32'hCDEF", 0xCDEF, 32, false)
		validateIntegerLiteral("32'h90ab", 0x90AB, 32, false)
		validateIntegerLiteral("32'hcdef", 0xCDEF, 32, false)
	}

	@Test
	def void verilogSigned() {
		validateIntegerLiteral("1'sd1", -1, 1, true)
		validateIntegerLiteral("3'sb101", -3, 3, true)
		validateIntegerLiteral("4'sb101", 5, 4, true)
		
		validateIntegerLiteral("6'sd42", -22, 6, true)
		validateIntegerLiteral("7'sd42", 42, 7, true)
		
		validateIntegerLiteral("6'so77", -1, 6, true)
		validateIntegerLiteral("6'so70", -8, 6, true)
		validateIntegerLiteral("6'so37", 31, 6, true)
		
		validateIntegerLiteral("8'shFF", -1, 8, true)
		validateIntegerLiteral("9'shFF", 255, 9, true)
	}

	@Test
	def void cStyle() {
		validateIntegerLiteral("0", 0, 0, false)
		validateIntegerLiteral("1", 1, 1, false)
		validateIntegerLiteral("100", 100, 7, false)
		validateIntegerLiteral("255", 255, 8, false)
		
		validateIntegerLiteral("0b0", 0, 0, false)
		validateIntegerLiteral("0b100", 4, 3, false)
		validateIntegerLiteral("0b101010", 42, 6, false)
		
		validateIntegerLiteral("077", 63, 6, false)
		validateIntegerLiteral("037", 31, 5, false)
		
		validateIntegerLiteral("0x0", 0, 0, false)
		validateIntegerLiteral("0x1234", 0x1234, 13, false)
		validateIntegerLiteral("0x5678", 0x5678, 15, false)
		validateIntegerLiteral("0x90AB", 0x90AB, 16, false)
		validateIntegerLiteral("0xCDEF", 0xCDEF, 16, false)
		validateIntegerLiteral("0x90ab", 0x90AB, 16, false)
		validateIntegerLiteral("0xcdef", 0xCDEF, 16, false)
	}
}