/*
 * generated by Xtext 2.10.0
 */
package com.minres.coredsl.tests

import com.google.inject.Inject
import com.minres.coredsl.coreDsl.DescriptionContent
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.Test
import org.junit.runner.RunWith
import static org.junit.Assert.assertTrue
import static org.junit.Assert.assertFalse
import java.io.FileReader
import static extension com.google.common.io.CharStreams.*

@RunWith(XtextRunner)
@InjectWith(CoreDslInjectorProvider)
class CoreDslCoreScopingTest {

    @Inject extension ParseHelper<DescriptionContent> parseHelper

    @Inject ValidationTestHelper validator

    @Test
    def void nestedScopeResolution1() {
        val content = '''
        InstructionSet BaseISA {
            architectural_state {
                unsigned X[32];
            }
        }
        
        InstructionSet TestISA extends BaseISA {
            instructions {
                Inst1 {
                    encoding: 0b0000000 :: rs2[4:0] :: rs1[4:0] :: 0b000 :: rd[4:0] :: 0b0000000;  
                    args_disass: "{name(rd)}, {name(rs1)}, {name(rs2)}";
                    behavior:
                        X[rd] = X[rs1] + X[rs2];
                }
            }
        }
        
        Core TestCore provides TestISA {
            instructions {
                Inst2 {
                    encoding: 0b0000000 :: rs2[4:0] :: rs1[4:0] :: 0b000 :: rd[4:0] :: 0b0000001;  
                    args_disass: "{name(rd)}, {name(rs1)}, {name(rs2)}";
                    behavior:
                        X[rd] = X[rs1] - X[rs2];
                }
            }
        	
        }
        '''.parse
        val issues = validator.validate(content)
        assertTrue(issues.isEmpty())
    }
    
}
