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

import static org.junit.Assert.assertEquals
import static org.junit.Assert.assertNotNull
import static org.junit.Assert.assertTrue

import static extension com.minres.coredsl.typing.TypeProvider.*
import static extension com.minres.coredsl.util.ModelUtil.*

@RunWith(XtextRunner)
@InjectWith(CoreDslInjectorProvider)
class CoreDslResourceTest {

    @Inject extension ParseHelper<DescriptionContent> parseHelper

    @Inject ValidationTestHelper validator
    
    @Test
    def void resourceDefinition() {
        val content = '''
        ResourceKind {
            Multiplier{Multiplier1(3) | Multiplier2(4)}
        }

        ResourceSets {
            Shifter{ReadPorts | ALU}
            RES_DEFAULT {I_RAM | IF | ID | D_RAM | WB}
        }
        
        InstructionSet TestISA {
            architectural_state {
                unsigned XLEN;
                unsigned<XLEN>  X[32];
            }
        }
        Core TestCore1 provides TestISA {
            architectural_state {
                unsigned XLEN=32;
                unsigned MUL_LEN=2*XLEN;
            }
            instructions{       
                SLL {
                    encoding: 0b0000000 :: rs2[4:0] :: rs1[4:0] :: 0b001 :: rd[4:0] :: 0b0110011;
                    args_disass:"{name(rd)}, {name(rs1)}, {name(rs2)}";
                    behavior: if(rd != 0) X[rd] = X[rs1]<< (X[rs2]&(XLEN-1));
                }
                MUL{
                    encoding: 0b0000001 :: rs2[4:0] :: rs1[4:0] :: 0b000 :: rd[4:0] :: 0b0110011;
                    args_disass:"{name(rd)}, {name(rs1)}, {name(rs2)}";
                    behavior: {
                        if(rd != 0){
                            signed<MUL_LEN> res = (signed<MUL_LEN>)X[rs1] * (signed<MUL_LEN>)X[rs2];
                            X[rd]= (unsigned<XLEN>)res;
                        }
                    }
                }
            }
            resources {
                MUL {Multiplier}   
                SLL {Shifter}
                [*] {ALU}
                [ALL] {RES_DEFAULT}
            }
            pipeline Pipeline1 {
                IF_stage {I_RAM | IF}
                ID_stage {ID}
                EX_stage {Multiplier1 | Shifter}
                WB_stage {D_RAM | WB}
            }
            pipeline Pipeline2 {
                IF_stage {I_RAM | IF}
                ID_stage {ID}
                EX_stage {Multiplier2 | Shifter}
                WB_stage {D_RAM | WB}
            }
        }
        '''.parse
        val issues = validator.validate(content)
        for (iss : issues)
            println(iss)
        assertTrue(issues.isEmpty())
        val decl = content.definitions.get(0).stateDeclarations.get(1).init.get(0).declarator
        assertEquals("X", decl.name)
        val dataType = decl.typeFor(content.definitions.last)
        assertNotNull(dataType)
        assertEquals(32, dataType.size)
    }
}
