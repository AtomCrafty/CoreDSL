/**
 * generated by Xtext 2.10.0
 */
package com.minres.coredsl.tests;

import com.google.inject.Inject;
import com.minres.coredsl.coreDsl.DescriptionContent;
import com.minres.coredsl.coreDsl.ISA;
import com.minres.coredsl.coreDsl.Instruction;
import com.minres.coredsl.coreDsl.InstructionSet;
import com.minres.coredsl.coreDsl.Register;
import com.minres.coredsl.coreDsl.RegisterFile;
import com.minres.coredsl.coreDsl.Variable;
import com.minres.coredsl.tests.CoreDslInjectorProvider;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.testing.InjectWith;
import org.eclipse.xtext.testing.XtextRunner;
import org.eclipse.xtext.testing.util.ParseHelper;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(XtextRunner.class)
@InjectWith(CoreDslInjectorProvider.class)
@SuppressWarnings("all")
public class CoreDslParsingTest {
  @Inject
  private ParseHelper<DescriptionContent> parseHelper;
  
  private final String isa1 = new Function0<String>() {
    @Override
    public String apply() {
      StringConcatenation _builder = new StringConcatenation();
      _builder.append("InsructionSet RV32I {");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("constants {");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("XLEN, FLEN");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("address_spaces {");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("MEMB[8], MEMH[16], MEMW[32], SFR[32]");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("}            ");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("registers { ");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("[31:0]   X[XLEN], FL[16], PC[48]");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("} ");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("instructions { ");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("ADDI {");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("encoding: imm[11:0] | rs1[4:0] | b000 | rd[4:0] | b0010011;");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("X[rd] <= X[rs1] + sext(imm, XLEN);");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("SLTI {");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("encoding: imm[11:0] | rs1[4:0] | b010 | rd[4:0] | b0010011;");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("X[rd] <= choose(X[rs1] < sext(imm, XLEN), 1, 0);");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("SLTIU {");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("encoding: imm[11:0] | rs1[4:0] | b011 | rd[4:0] | b0010011;");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("X[rd] <= choose(X[rs1] < zext(imm, XLEN), 1, 0);");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("SW {");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("encoding: imm[11:5] | rs2[4:0] | rs1[4:0] | b010 | imm[4:0] | b0100011;");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("val offset[XLEN] <= X[rs1] + sext(imm, XLEN);");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("MEMW[offset]{32} <= X[rs2];");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("JAL(no_cont) {");
      _builder.newLine();
      _builder.append("                ");
      _builder.append("encoding:imm[20:20]s | imm[10:1]s | imm[11:11]s | imm[19:12]s | rd[4:0] | b1101111;");
      _builder.newLine();
      _builder.append("                ");
      _builder.append("if(rd!=0) X[rd] <= zext(PC);");
      _builder.newLine();
      _builder.append("                ");
      _builder.append("PC<=PC+sext(imm, 48);");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("}");
      _builder.newLine();
      return _builder.toString();
    }
  }.apply();
  
  @Test
  public void loadModel() {
    try {
      final DescriptionContent content = this.parseHelper.parse(this.isa1);
      Assert.assertEquals(1, content.getDefinitions().size());
      ISA _get = content.getDefinitions().get(0);
      final InstructionSet result = ((InstructionSet) _get);
      Assert.assertNotNull(result);
      final Resource resource = result.eResource();
      EcoreUtil.resolveAll(resource);
      Assert.assertEquals(0, resource.getErrors().size());
      Assert.assertEquals(0, resource.getWarnings().size());
      Assert.assertEquals("RV32I", result.getName());
      Assert.assertNull(result.getSuperType());
      Assert.assertEquals(result.getSpaces().size(), 4);
      Assert.assertNotNull(result.getRegs());
      Assert.assertNotNull(result.getInstr());
      Assert.assertEquals(3, result.getRegs().size());
      Variable _get_1 = result.getRegs().get(0);
      Assert.assertTrue((_get_1 instanceof RegisterFile));
      Variable _get_2 = result.getRegs().get(0);
      Assert.assertEquals("X", ((RegisterFile) _get_2).getName());
      Variable _get_3 = result.getRegs().get(0);
      Assert.assertEquals(Integer.valueOf(0), ((RegisterFile) _get_3).getBitSize());
      Variable _get_4 = result.getRegs().get(0);
      Assert.assertNotNull(((RegisterFile) _get_4).getBitSizeConst());
      Variable _get_5 = result.getRegs().get(0);
      final RegisterFile regFile = ((RegisterFile) _get_5);
      Assert.assertEquals(Integer.valueOf(31), regFile.getRange().getLeft());
      Assert.assertEquals(Integer.valueOf(0), regFile.getRange().getRight());
      Variable _get_6 = result.getRegs().get(2);
      Assert.assertTrue((_get_6 instanceof Register));
      Variable _get_7 = result.getRegs().get(2);
      Assert.assertEquals("PC", ((Register) _get_7).getName());
      Variable _get_8 = result.getRegs().get(2);
      Assert.assertEquals(Integer.valueOf(48), ((Register) _get_8).getBitSize());
      Variable _get_9 = result.getRegs().get(2);
      Assert.assertNull(((Register) _get_9).getBitSizeConst());
      Assert.assertEquals(5, result.getInstr().size());
      final Instruction i0 = result.getInstr().get(0);
      Assert.assertEquals("ADDI", i0.getName());
      Assert.assertEquals(5, i0.getEncoding().getFields().size());
      Assert.assertNotNull(i0.getOperation());
      Assert.assertEquals(1, i0.getOperation().getStatements().size());
      final Instruction i1 = result.getInstr().get(1);
      Assert.assertEquals("SLTI", i1.getName());
      Assert.assertEquals(5, i1.getEncoding().getFields().size());
      Assert.assertNotNull(i1.getOperation());
      Assert.assertEquals(1, i1.getOperation().getStatements().size());
      final Instruction i2 = result.getInstr().get(2);
      Assert.assertEquals("SLTIU", i2.getName());
      Assert.assertEquals(5, i2.getEncoding().getFields().size());
      Assert.assertNotNull(i2.getOperation());
      Assert.assertEquals(1, i2.getOperation().getStatements().size());
      final Instruction i3 = result.getInstr().get(3);
      Assert.assertEquals("SW", i3.getName());
      Assert.assertEquals(6, i3.getEncoding().getFields().size());
      Assert.assertNotNull(i3.getOperation());
      Assert.assertEquals(2, i3.getOperation().getStatements().size());
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
