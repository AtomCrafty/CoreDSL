/*
 * generated by Xtext 2.10.0
 */
package com.minres.coredsl.tests

import com.google.inject.Inject
import com.minres.coredsl.coreDsl.DescriptionContent
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

import static org.junit.jupiter.api.Assertions.assertTrue

@ExtendWith(InjectionExtension)
@InjectWith(CoreDslInjectorProvider)
class CoreDslCoreScopingTest {

    @Inject extension ParseHelper<DescriptionContent> parseHelper

    @Inject ValidationTestHelper validator

    @Test
    def void nestedScopeResolution1() {
        val content = '''
        InstructionSet BaseISA {
            architectural_state {
                unsigned int X[32];
            }
        }
        
        InstructionSet TestISA extends BaseISA {
            instructions {
                Inst1 {
                    encoding: 0b0000000 :: rs2[4:0] :: rs1[4:0] :: 0b000 :: rd[4:0] :: 0b0000000;
                    args_disass: "{name(rd)}, {name(rs1)}, {name(rs2)}";
                    behavior:
                        X[rd] = (unsigned int)(X[rs1] + X[rs2]);
                }
            }
        }
        
        Core TestCore provides TestISA {
            instructions {
                Inst2 {
                    encoding: 0b0000000 :: rs2[4:0] :: rs1[4:0] :: 0b000 :: rd[4:0] :: 0b0000001;
                    args_disass: "{name(rd)}, {name(rs1)}, {name(rs2)}";
                    behavior:
                        X[rd] = (unsigned int)(X[rs1] - X[rs2]);
                }
            }
        	
        }
        '''.parse
        val issues = validator.validate(content)
        issues.forEach[println]
        assertTrue(issues.isEmpty())
    }
    
}
