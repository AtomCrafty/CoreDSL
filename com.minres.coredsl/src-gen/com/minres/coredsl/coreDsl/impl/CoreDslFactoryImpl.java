/**
 * generated by Xtext 2.22.0
 */
package com.minres.coredsl.coreDsl.impl;

import com.minres.coredsl.coreDsl.*;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EDataType;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.impl.EFactoryImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Factory</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class CoreDslFactoryImpl extends EFactoryImpl implements CoreDslFactory
{
  /**
   * Creates the default factory implementation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static CoreDslFactory init()
  {
    try
    {
      CoreDslFactory theCoreDslFactory = (CoreDslFactory)EPackage.Registry.INSTANCE.getEFactory(CoreDslPackage.eNS_URI);
      if (theCoreDslFactory != null)
      {
        return theCoreDslFactory;
      }
    }
    catch (Exception exception)
    {
      EcorePlugin.INSTANCE.log(exception);
    }
    return new CoreDslFactoryImpl();
  }

  /**
   * Creates an instance of the factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public CoreDslFactoryImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public EObject create(EClass eClass)
  {
    switch (eClass.getClassifierID())
    {
      case CoreDslPackage.DESCRIPTION_CONTENT: return createDescriptionContent();
      case CoreDslPackage.IMPORT: return createImport();
      case CoreDslPackage.ISA: return createISA();
      case CoreDslPackage.INSTRUCTION_SET: return createInstructionSet();
      case CoreDslPackage.CORE_DEF: return createCoreDef();
      case CoreDslPackage.INSTRUCTION: return createInstruction();
      case CoreDslPackage.ENCODING: return createEncoding();
      case CoreDslPackage.FIELD: return createField();
      case CoreDslPackage.BIT_VALUE: return createBitValue();
      case CoreDslPackage.BIT_FIELD: return createBitField();
      case CoreDslPackage.RANGE_SPEC: return createRangeSpec();
      case CoreDslPackage.FUNCTION_DEFINITION: return createFunctionDefinition();
      case CoreDslPackage.PARAMETER_LIST: return createParameterList();
      case CoreDslPackage.PARAMETER_DECLARATION: return createParameterDeclaration();
      case CoreDslPackage.STATEMENT: return createStatement();
      case CoreDslPackage.LABELED_STATEMENT: return createLabeledStatement();
      case CoreDslPackage.COMPOUND_STATEMENT: return createCompoundStatement();
      case CoreDslPackage.BLOCK_ITEM: return createBlockItem();
      case CoreDslPackage.EXPRESSION_STATEMENT: return createExpressionStatement();
      case CoreDslPackage.SELECTION_STATEMENT: return createSelectionStatement();
      case CoreDslPackage.IF_STATEMENT: return createIfStatement();
      case CoreDslPackage.SWITCH_STATEMENT: return createSwitchStatement();
      case CoreDslPackage.ITERATION_STATEMENT: return createIterationStatement();
      case CoreDslPackage.FOR_CONDITION: return createForCondition();
      case CoreDslPackage.JUMP_STATEMENT: return createJumpStatement();
      case CoreDslPackage.DECLARATION: return createDeclaration();
      case CoreDslPackage.TYPE_OR_VAR_DECLARATION: return createTypeOrVarDeclaration();
      case CoreDslPackage.TYPEDEF_DECLARATION: return createTypedefDeclaration();
      case CoreDslPackage.DECLARATION_SPECIFIER: return createDeclarationSpecifier();
      case CoreDslPackage.ATTRIBUTE_LIST: return createAttributeList();
      case CoreDslPackage.TYPE_SPECIFIER: return createTypeSpecifier();
      case CoreDslPackage.DATA_TYPE_SPECIFIER: return createDataTypeSpecifier();
      case CoreDslPackage.TYPEDEF_REF: return createTypedefRef();
      case CoreDslPackage.POD_SPECIFIER: return createPodSpecifier();
      case CoreDslPackage.BIT_SIZE_SPECIFIER: return createBitSizeSpecifier();
      case CoreDslPackage.BIT_SIZE_VALUE: return createBitSizeValue();
      case CoreDslPackage.ENUM_SPECIFIER: return createEnumSpecifier();
      case CoreDslPackage.ENUMERATOR_LIST: return createEnumeratorList();
      case CoreDslPackage.ENUMERATOR: return createEnumerator();
      case CoreDslPackage.STRUCT_OR_UNION_SPECIFIER: return createStructOrUnionSpecifier();
      case CoreDslPackage.STRUCT_DECLARATION: return createStructDeclaration();
      case CoreDslPackage.STRUCT_DECLARATION_SPECIFIER: return createStructDeclarationSpecifier();
      case CoreDslPackage.INIT_DECLARATOR: return createInitDeclarator();
      case CoreDslPackage.DIRECT_DECLARATOR: return createDirectDeclarator();
      case CoreDslPackage.EMPTY_EXPRESSION: return createEmptyExpression();
      case CoreDslPackage.INITIALIZER: return createInitializer();
      case CoreDslPackage.INITIALIZER_LIST: return createInitializerList();
      case CoreDslPackage.DESIGNATED_INITIALIZER: return createDesignatedInitializer();
      case CoreDslPackage.DESIGNATOR: return createDesignator();
      case CoreDslPackage.ABSTRACT_DECLARATOR: return createAbstractDeclarator();
      case CoreDslPackage.DIRECT_ABSTRACT_DECLARATOR: return createDirectAbstractDeclarator();
      case CoreDslPackage.EXPRESSION: return createExpression();
      case CoreDslPackage.CAST_EXPRESSION: return createCastExpression();
      case CoreDslPackage.PREFIX_EXPRESSION: return createPrefixExpression();
      case CoreDslPackage.UNARY_OPERATOR: return createUnaryOperator();
      case CoreDslPackage.POSTFIX_EXPRESSION: return createPostfixExpression();
      case CoreDslPackage.POSTFIX_OPERATOR: return createPostfixOperator();
      case CoreDslPackage.PRIMARY_EXPRESSION: return createPrimaryExpression();
      case CoreDslPackage.VARIABLE_REF: return createVariableRef();
      case CoreDslPackage.STRING_LITERAL: return createStringLiteral();
      case CoreDslPackage.ENCODING_PREFIX: return createEncodingPrefix();
      case CoreDslPackage.CONSTANT: return createConstant();
      case CoreDslPackage.INTEGER_CONSTANT: return createIntegerConstant();
      case CoreDslPackage.FLOATING_CONSTANT: return createFloatingConstant();
      case CoreDslPackage.BOOL_CONSTANT: return createBoolConstant();
      case CoreDslPackage.INTEGER_SUFFIX: return createIntegerSuffix();
      case CoreDslPackage.UNSIGNED_SUFFIX: return createUnsignedSuffix();
      case CoreDslPackage.LONG_SUFFIX: return createLongSuffix();
      case CoreDslPackage.LONG_LONG_SUFFIX: return createLongLongSuffix();
      case CoreDslPackage.FLOATING_SUFFIX: return createFloatingSuffix();
      case CoreDslPackage.CHARACTER_CONSTANT: return createCharacterConstant();
      case CoreDslPackage.ASSIGNMENT_EXPRESSION: return createAssignmentExpression();
      case CoreDslPackage.CONDITIONAL_EXPRESSION: return createConditionalExpression();
      case CoreDslPackage.INFIX_EXPRESSION: return createInfixExpression();
      default:
        throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Object createFromString(EDataType eDataType, String initialValue)
  {
    switch (eDataType.getClassifierID())
    {
      case CoreDslPackage.DATA_TYPES:
        return createDataTypesFromString(eDataType, initialValue);
      case CoreDslPackage.TYPE_QUALIFIER:
        return createTypeQualifierFromString(eDataType, initialValue);
      case CoreDslPackage.STORAGE_CLASS_SPECIFIER:
        return createStorageClassSpecifierFromString(eDataType, initialValue);
      case CoreDslPackage.ATTRIBUTE:
        return createAttributeFromString(eDataType, initialValue);
      case CoreDslPackage.INSTR_ATTRIBUTE:
        return createInstrAttributeFromString(eDataType, initialValue);
      case CoreDslPackage.STRUCT_OR_UNION:
        return createStructOrUnionFromString(eDataType, initialValue);
      case CoreDslPackage.BITFIELD_DATA_TYPE:
        return createBitfieldDataTypeFromString(eDataType, initialValue);
      default:
        throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public String convertToString(EDataType eDataType, Object instanceValue)
  {
    switch (eDataType.getClassifierID())
    {
      case CoreDslPackage.DATA_TYPES:
        return convertDataTypesToString(eDataType, instanceValue);
      case CoreDslPackage.TYPE_QUALIFIER:
        return convertTypeQualifierToString(eDataType, instanceValue);
      case CoreDslPackage.STORAGE_CLASS_SPECIFIER:
        return convertStorageClassSpecifierToString(eDataType, instanceValue);
      case CoreDslPackage.ATTRIBUTE:
        return convertAttributeToString(eDataType, instanceValue);
      case CoreDslPackage.INSTR_ATTRIBUTE:
        return convertInstrAttributeToString(eDataType, instanceValue);
      case CoreDslPackage.STRUCT_OR_UNION:
        return convertStructOrUnionToString(eDataType, instanceValue);
      case CoreDslPackage.BITFIELD_DATA_TYPE:
        return convertBitfieldDataTypeToString(eDataType, instanceValue);
      default:
        throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public DescriptionContent createDescriptionContent()
  {
    DescriptionContentImpl descriptionContent = new DescriptionContentImpl();
    return descriptionContent;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Import createImport()
  {
    ImportImpl import_ = new ImportImpl();
    return import_;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public ISA createISA()
  {
    ISAImpl isa = new ISAImpl();
    return isa;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public InstructionSet createInstructionSet()
  {
    InstructionSetImpl instructionSet = new InstructionSetImpl();
    return instructionSet;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public CoreDef createCoreDef()
  {
    CoreDefImpl coreDef = new CoreDefImpl();
    return coreDef;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Instruction createInstruction()
  {
    InstructionImpl instruction = new InstructionImpl();
    return instruction;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Encoding createEncoding()
  {
    EncodingImpl encoding = new EncodingImpl();
    return encoding;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Field createField()
  {
    FieldImpl field = new FieldImpl();
    return field;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public BitValue createBitValue()
  {
    BitValueImpl bitValue = new BitValueImpl();
    return bitValue;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public BitField createBitField()
  {
    BitFieldImpl bitField = new BitFieldImpl();
    return bitField;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public RangeSpec createRangeSpec()
  {
    RangeSpecImpl rangeSpec = new RangeSpecImpl();
    return rangeSpec;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public FunctionDefinition createFunctionDefinition()
  {
    FunctionDefinitionImpl functionDefinition = new FunctionDefinitionImpl();
    return functionDefinition;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public ParameterList createParameterList()
  {
    ParameterListImpl parameterList = new ParameterListImpl();
    return parameterList;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public ParameterDeclaration createParameterDeclaration()
  {
    ParameterDeclarationImpl parameterDeclaration = new ParameterDeclarationImpl();
    return parameterDeclaration;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Statement createStatement()
  {
    StatementImpl statement = new StatementImpl();
    return statement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public LabeledStatement createLabeledStatement()
  {
    LabeledStatementImpl labeledStatement = new LabeledStatementImpl();
    return labeledStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public CompoundStatement createCompoundStatement()
  {
    CompoundStatementImpl compoundStatement = new CompoundStatementImpl();
    return compoundStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public BlockItem createBlockItem()
  {
    BlockItemImpl blockItem = new BlockItemImpl();
    return blockItem;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public ExpressionStatement createExpressionStatement()
  {
    ExpressionStatementImpl expressionStatement = new ExpressionStatementImpl();
    return expressionStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public SelectionStatement createSelectionStatement()
  {
    SelectionStatementImpl selectionStatement = new SelectionStatementImpl();
    return selectionStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public IfStatement createIfStatement()
  {
    IfStatementImpl ifStatement = new IfStatementImpl();
    return ifStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public SwitchStatement createSwitchStatement()
  {
    SwitchStatementImpl switchStatement = new SwitchStatementImpl();
    return switchStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public IterationStatement createIterationStatement()
  {
    IterationStatementImpl iterationStatement = new IterationStatementImpl();
    return iterationStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public ForCondition createForCondition()
  {
    ForConditionImpl forCondition = new ForConditionImpl();
    return forCondition;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public JumpStatement createJumpStatement()
  {
    JumpStatementImpl jumpStatement = new JumpStatementImpl();
    return jumpStatement;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Declaration createDeclaration()
  {
    DeclarationImpl declaration = new DeclarationImpl();
    return declaration;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public TypeOrVarDeclaration createTypeOrVarDeclaration()
  {
    TypeOrVarDeclarationImpl typeOrVarDeclaration = new TypeOrVarDeclarationImpl();
    return typeOrVarDeclaration;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public TypedefDeclaration createTypedefDeclaration()
  {
    TypedefDeclarationImpl typedefDeclaration = new TypedefDeclarationImpl();
    return typedefDeclaration;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public DeclarationSpecifier createDeclarationSpecifier()
  {
    DeclarationSpecifierImpl declarationSpecifier = new DeclarationSpecifierImpl();
    return declarationSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public AttributeList createAttributeList()
  {
    AttributeListImpl attributeList = new AttributeListImpl();
    return attributeList;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public TypeSpecifier createTypeSpecifier()
  {
    TypeSpecifierImpl typeSpecifier = new TypeSpecifierImpl();
    return typeSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public DataTypeSpecifier createDataTypeSpecifier()
  {
    DataTypeSpecifierImpl dataTypeSpecifier = new DataTypeSpecifierImpl();
    return dataTypeSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public TypedefRef createTypedefRef()
  {
    TypedefRefImpl typedefRef = new TypedefRefImpl();
    return typedefRef;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public PodSpecifier createPodSpecifier()
  {
    PodSpecifierImpl podSpecifier = new PodSpecifierImpl();
    return podSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public BitSizeSpecifier createBitSizeSpecifier()
  {
    BitSizeSpecifierImpl bitSizeSpecifier = new BitSizeSpecifierImpl();
    return bitSizeSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public BitSizeValue createBitSizeValue()
  {
    BitSizeValueImpl bitSizeValue = new BitSizeValueImpl();
    return bitSizeValue;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public EnumSpecifier createEnumSpecifier()
  {
    EnumSpecifierImpl enumSpecifier = new EnumSpecifierImpl();
    return enumSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public EnumeratorList createEnumeratorList()
  {
    EnumeratorListImpl enumeratorList = new EnumeratorListImpl();
    return enumeratorList;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Enumerator createEnumerator()
  {
    EnumeratorImpl enumerator = new EnumeratorImpl();
    return enumerator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public StructOrUnionSpecifier createStructOrUnionSpecifier()
  {
    StructOrUnionSpecifierImpl structOrUnionSpecifier = new StructOrUnionSpecifierImpl();
    return structOrUnionSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public StructDeclaration createStructDeclaration()
  {
    StructDeclarationImpl structDeclaration = new StructDeclarationImpl();
    return structDeclaration;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public StructDeclarationSpecifier createStructDeclarationSpecifier()
  {
    StructDeclarationSpecifierImpl structDeclarationSpecifier = new StructDeclarationSpecifierImpl();
    return structDeclarationSpecifier;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public InitDeclarator createInitDeclarator()
  {
    InitDeclaratorImpl initDeclarator = new InitDeclaratorImpl();
    return initDeclarator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public DirectDeclarator createDirectDeclarator()
  {
    DirectDeclaratorImpl directDeclarator = new DirectDeclaratorImpl();
    return directDeclarator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public EmptyExpression createEmptyExpression()
  {
    EmptyExpressionImpl emptyExpression = new EmptyExpressionImpl();
    return emptyExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Initializer createInitializer()
  {
    InitializerImpl initializer = new InitializerImpl();
    return initializer;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public InitializerList createInitializerList()
  {
    InitializerListImpl initializerList = new InitializerListImpl();
    return initializerList;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public DesignatedInitializer createDesignatedInitializer()
  {
    DesignatedInitializerImpl designatedInitializer = new DesignatedInitializerImpl();
    return designatedInitializer;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Designator createDesignator()
  {
    DesignatorImpl designator = new DesignatorImpl();
    return designator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public AbstractDeclarator createAbstractDeclarator()
  {
    AbstractDeclaratorImpl abstractDeclarator = new AbstractDeclaratorImpl();
    return abstractDeclarator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public DirectAbstractDeclarator createDirectAbstractDeclarator()
  {
    DirectAbstractDeclaratorImpl directAbstractDeclarator = new DirectAbstractDeclaratorImpl();
    return directAbstractDeclarator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Expression createExpression()
  {
    ExpressionImpl expression = new ExpressionImpl();
    return expression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public CastExpression createCastExpression()
  {
    CastExpressionImpl castExpression = new CastExpressionImpl();
    return castExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public PrefixExpression createPrefixExpression()
  {
    PrefixExpressionImpl prefixExpression = new PrefixExpressionImpl();
    return prefixExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public UnaryOperator createUnaryOperator()
  {
    UnaryOperatorImpl unaryOperator = new UnaryOperatorImpl();
    return unaryOperator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public PostfixExpression createPostfixExpression()
  {
    PostfixExpressionImpl postfixExpression = new PostfixExpressionImpl();
    return postfixExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public PostfixOperator createPostfixOperator()
  {
    PostfixOperatorImpl postfixOperator = new PostfixOperatorImpl();
    return postfixOperator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public PrimaryExpression createPrimaryExpression()
  {
    PrimaryExpressionImpl primaryExpression = new PrimaryExpressionImpl();
    return primaryExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public VariableRef createVariableRef()
  {
    VariableRefImpl variableRef = new VariableRefImpl();
    return variableRef;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public StringLiteral createStringLiteral()
  {
    StringLiteralImpl stringLiteral = new StringLiteralImpl();
    return stringLiteral;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public EncodingPrefix createEncodingPrefix()
  {
    EncodingPrefixImpl encodingPrefix = new EncodingPrefixImpl();
    return encodingPrefix;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Constant createConstant()
  {
    ConstantImpl constant = new ConstantImpl();
    return constant;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public IntegerConstant createIntegerConstant()
  {
    IntegerConstantImpl integerConstant = new IntegerConstantImpl();
    return integerConstant;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public FloatingConstant createFloatingConstant()
  {
    FloatingConstantImpl floatingConstant = new FloatingConstantImpl();
    return floatingConstant;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public BoolConstant createBoolConstant()
  {
    BoolConstantImpl boolConstant = new BoolConstantImpl();
    return boolConstant;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public IntegerSuffix createIntegerSuffix()
  {
    IntegerSuffixImpl integerSuffix = new IntegerSuffixImpl();
    return integerSuffix;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public UnsignedSuffix createUnsignedSuffix()
  {
    UnsignedSuffixImpl unsignedSuffix = new UnsignedSuffixImpl();
    return unsignedSuffix;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public LongSuffix createLongSuffix()
  {
    LongSuffixImpl longSuffix = new LongSuffixImpl();
    return longSuffix;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public LongLongSuffix createLongLongSuffix()
  {
    LongLongSuffixImpl longLongSuffix = new LongLongSuffixImpl();
    return longLongSuffix;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public FloatingSuffix createFloatingSuffix()
  {
    FloatingSuffixImpl floatingSuffix = new FloatingSuffixImpl();
    return floatingSuffix;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public CharacterConstant createCharacterConstant()
  {
    CharacterConstantImpl characterConstant = new CharacterConstantImpl();
    return characterConstant;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public AssignmentExpression createAssignmentExpression()
  {
    AssignmentExpressionImpl assignmentExpression = new AssignmentExpressionImpl();
    return assignmentExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public ConditionalExpression createConditionalExpression()
  {
    ConditionalExpressionImpl conditionalExpression = new ConditionalExpressionImpl();
    return conditionalExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public InfixExpression createInfixExpression()
  {
    InfixExpressionImpl infixExpression = new InfixExpressionImpl();
    return infixExpression;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public DataTypes createDataTypesFromString(EDataType eDataType, String initialValue)
  {
    DataTypes result = DataTypes.get(initialValue);
    if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
    return result;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String convertDataTypesToString(EDataType eDataType, Object instanceValue)
  {
    return instanceValue == null ? null : instanceValue.toString();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public TypeQualifier createTypeQualifierFromString(EDataType eDataType, String initialValue)
  {
    TypeQualifier result = TypeQualifier.get(initialValue);
    if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
    return result;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String convertTypeQualifierToString(EDataType eDataType, Object instanceValue)
  {
    return instanceValue == null ? null : instanceValue.toString();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public StorageClassSpecifier createStorageClassSpecifierFromString(EDataType eDataType, String initialValue)
  {
    StorageClassSpecifier result = StorageClassSpecifier.get(initialValue);
    if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
    return result;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String convertStorageClassSpecifierToString(EDataType eDataType, Object instanceValue)
  {
    return instanceValue == null ? null : instanceValue.toString();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Attribute createAttributeFromString(EDataType eDataType, String initialValue)
  {
    Attribute result = Attribute.get(initialValue);
    if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
    return result;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String convertAttributeToString(EDataType eDataType, Object instanceValue)
  {
    return instanceValue == null ? null : instanceValue.toString();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public InstrAttribute createInstrAttributeFromString(EDataType eDataType, String initialValue)
  {
    InstrAttribute result = InstrAttribute.get(initialValue);
    if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
    return result;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String convertInstrAttributeToString(EDataType eDataType, Object instanceValue)
  {
    return instanceValue == null ? null : instanceValue.toString();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public StructOrUnion createStructOrUnionFromString(EDataType eDataType, String initialValue)
  {
    StructOrUnion result = StructOrUnion.get(initialValue);
    if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
    return result;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String convertStructOrUnionToString(EDataType eDataType, Object instanceValue)
  {
    return instanceValue == null ? null : instanceValue.toString();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public BitfieldDataType createBitfieldDataTypeFromString(EDataType eDataType, String initialValue)
  {
    BitfieldDataType result = BitfieldDataType.get(initialValue);
    if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
    return result;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String convertBitfieldDataTypeToString(EDataType eDataType, Object instanceValue)
  {
    return instanceValue == null ? null : instanceValue.toString();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public CoreDslPackage getCoreDslPackage()
  {
    return (CoreDslPackage)getEPackage();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @deprecated
   * @generated
   */
  @Deprecated
  public static CoreDslPackage getPackage()
  {
    return CoreDslPackage.eINSTANCE;
  }

} //CoreDslFactoryImpl
