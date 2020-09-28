/*
 * generated by Xtext 2.22.0
 */
grammar DebugInternalCoreDsl;

// Rule DescriptionContent
ruleDescriptionContent:
	ruleImport
	*
	ruleISA
	+
;

// Rule Import
ruleImport:
	'import'
	RULE_STRING
;

// Rule ISA
ruleISA:
	(
		ruleInstructionSet
		    |
		ruleCoreDef
	)
;

// Rule InstructionSet
ruleInstructionSet:
	'InstructionSet'
	RULE_ID
	(
		'extends'
		RULE_ID
	)?
	'{'
	(
		'constants'
		'{'
		ruleDeclaration
		+
		'}'
	)?
	(
		'address_spaces'
		'{'
		ruleDeclaration
		+
		'}'
	)?
	(
		'registers'
		'{'
		ruleDeclaration
		+
		'}'
	)?
	(
		'functions'
		'{'
		ruleFunctionDefinition
		+
		'}'
	)?
	'instructions'
	'{'
	ruleInstruction
	+
	'}'
	'}'
;

// Rule CoreDef
ruleCoreDef:
	'Core'
	RULE_ID
	(
		'provides'
		RULE_ID
		(
			','
			RULE_ID
		)*
	)?
	'{'
	(
		'constants'
		'{'
		ruleDeclaration
		+
		'}'
	)?
	(
		'address_spaces'
		'{'
		ruleDeclaration
		+
		'}'
	)?
	(
		'registers'
		'{'
		ruleDeclaration
		+
		'}'
	)?
	(
		'instructions'
		'{'
		ruleInstruction
		+
		'}'
	)?
	'}'
;

// Rule Instruction
ruleInstruction:
	RULE_ID
	(
		'[['
		ruleInstrAttribute
		(
			','
			ruleInstrAttribute
		)*
		']]'
	)?
	'{'
	'encoding'
	':'
	ruleEncoding
	';'
	(
		'args_disass'
		':'
		RULE_STRING
		';'
	)?
	'behavior'
	':'
	ruleCompoundStatement
	'}'
;

// Rule Encoding
ruleEncoding:
	ruleField
	(
		'|'
		ruleField
	)*
;

// Rule Field
ruleField:
	(
		ruleBitValue
		    |
		ruleBitField
	)
;

// Rule BitValue
ruleBitValue:
	RULE_BVAL
;

// Rule BitField
ruleBitField:
	RULE_ID
	ruleRangeSpec
	(
		'\''?
		ruleBitfieldDataType
	)?
;

// Rule RangeSpec
ruleRangeSpec:
	'['
	RULE_INTEGER
	':'
	RULE_INTEGER
	']'
;

// Rule FunctionDefinition
ruleFunctionDefinition:
	'extern'
	?
	ruleTypeSpecifier
	RULE_ID
	'('
	ruleParameterList
	')'
	ruleCompoundStatement
;

// Rule ParameterList
ruleParameterList:
	ruleParameterDeclaration
	(
		','
		ruleParameterDeclaration
	)*
;

// Rule ParameterDeclaration
ruleParameterDeclaration:
	ruleTypeSpecifier
	(
		ruleDirectDeclarator
		    |
		ruleAbstractDeclarator
	)?
;

// Rule Statement
ruleStatement:
	(
		ruleCompoundStatement
		    |
		ruleExpressionStatement
		    |
		ruleSelectionStatement
		    |
		ruleIterationStatement
		    |
		ruleJumpStatement
	)
;

// Rule LabeledStatement
ruleLabeledStatement:
	(
		'case'
		ruleConstantExpression
		':'
		ruleStatement
		    |
		'default'
		':'
		ruleStatement
	)
;

// Rule CompoundStatement
ruleCompoundStatement:
	'{'
	ruleBlockItem
	*
	'}'
;

// Rule BlockItem
ruleBlockItem:
	(
		ruleStatement
		    |
		ruleDeclaration
	)
;

// Rule ExpressionStatement
ruleExpressionStatement:
	ruleAssignmentExpression
	?
	';'
;

// Rule SelectionStatement
ruleSelectionStatement:
	(
		ruleIfStatement
		    |
		ruleSwitchStatement
	)
;

// Rule IfStatement
ruleIfStatement:
	'if'
	'('
	ruleConditionalExpression
	')'
	ruleStatement
	(
		(
			('else')=>
			'else'
		)
		ruleStatement
	)?
;

// Rule SwitchStatement
ruleSwitchStatement:
	'switch'
	'('
	ruleConditionalExpression
	')'
	'{'
	ruleLabeledStatement
	'}'
;

// Rule IterationStatement
ruleIterationStatement:
	(
		'while'
		'('
		ruleConditionalExpression
		')'
		ruleStatement
		    |
		'do'
		ruleStatement
		'while'
		'('
		ruleConditionalExpression
		')'
		';'
		    |
		'for'
		'('
		ruleForCondition
		')'
		ruleStatement
	)
;

// Rule ForCondition
ruleForCondition:
	(
		ruleDeclaration
		    |
		ruleExpression
		?
		';'
	)
	ruleConditionalExpression
	?
	';'
	(
		ruleAssignmentExpression
		(
			','
			ruleAssignmentExpression
		)*
	)?
;

// Rule JumpStatement
ruleJumpStatement:
	(
		'continue'
		';'
		    |
		'break'
		';'
		    |
		'return'
		ruleConditionalExpression
		?
		';'
	)
;

// Rule Declaration
ruleDeclaration:
	(
		ruleTypeOrVarDeclaration
		    |
		ruleTypedefDeclaration
	)
;

// Rule TypeOrVarDeclaration
ruleTypeOrVarDeclaration:
	ruleDeclarationSpecifier*
	ruleTypeSpecifier
	ruleBitSizeSpecifier
	?
	(
		ruleInitDeclarator
		(
			','
			ruleInitDeclarator
		)*
	)?
	';'
;

// Rule TypedefDeclaration
ruleTypedefDeclaration:
	'typedef'
	ruleDeclarationSpecifier*
	ruleTypeSpecifier
	ruleInitDeclarator
	';'
;

// Rule DeclarationSpecifier
ruleDeclarationSpecifier:
	(
		ruleStorageClassSpecifier
		    |
		ruleTypeQualifier
		    |
		ruleAttributeList
	)
;

// Rule AttributeList
ruleAttributeList:
	'[['
	ruleAttribute
	(
		','
		ruleAttribute
	)*
	']]'
;

// Rule TypeSpecifier
ruleTypeSpecifier:
	(
		ruleDataTypeSpecifier
		    |
		ruleTypedefRef
	)
;

// Rule DataTypeSpecifier
ruleDataTypeSpecifier:
	(
		rulePodSpecifier
		    |
		ruleStructOrUnionSpecifier
		    |
		ruleEnumSpecifier
	)
;

// Rule TypedefRef
ruleTypedefRef:
	RULE_ID
;

// Rule PodSpecifier
rulePodSpecifier:
	ruleDataTypes
	+
;

// Rule BitSizeSpecifier
ruleBitSizeSpecifier:
	'<'
	ruleBitSizeValue
	(
		','
		ruleBitSizeValue
		','
		ruleBitSizeValue
		','
		ruleBitSizeValue
	)?
	'>'
;

// Rule BitSizeValue
ruleBitSizeValue:
	(
		RULE_INTEGER
		    |
		RULE_ID
	)
;

// Rule EnumSpecifier
ruleEnumSpecifier:
	(
		'enum'
		RULE_ID
		?
		'{'
		ruleEnumeratorList
		','?
		'}'
		    |
		'enum'
		RULE_ID
	)
;

// Rule EnumeratorList
ruleEnumeratorList:
	ruleEnumerator
	(
		','
		ruleEnumerator
	)*
;

// Rule Enumerator
ruleEnumerator:
	(
		RULE_ID
		    |
		RULE_ID
		'='
		ruleConstantExpression
	)
;

// Rule StructOrUnionSpecifier
ruleStructOrUnionSpecifier:
	(
		ruleStructOrUnion
		RULE_ID
		?
		'{'
		ruleStructDeclaration
		*
		'}'
		    |
		ruleStructOrUnion
		RULE_ID
	)
;

// Rule StructDeclaration
ruleStructDeclaration:
	ruleStructDeclarationSpecifier
	ruleDirectDeclarator
	(
		','
		ruleDirectDeclarator
	)*
	';'
;

// Rule StructDeclarationSpecifier
ruleStructDeclarationSpecifier:
	(
		ruleTypeSpecifier
		    |
		ruleTypeQualifier
	)
;

// Rule InitDeclarator
ruleInitDeclarator:
	ruleDirectDeclarator
	(
		'='
		ruleInitializer
	)?
;

// Rule DirectDeclarator
ruleDirectDeclarator:
	RULE_ID
	(
		':'
		ruleIntegerConstant
	)?
	(
		'['
		ruleTypeQualifier
		?
		ruleConditionalExpression
		?
		']'
	)?
;

// Rule InitializerList
ruleInitializerList:
	(
		ruleDesignatedInitializer
		    |ruleInitializer
	)
	(
		','
		(
			ruleDesignatedInitializer
			    |ruleInitializer
		)
	)?
;

// Rule Initializer
ruleInitializer:
	(
		ruleConditionalExpression
		    |
		'{'
		ruleInitializerList
		','?
		'}'
	)
;

// Rule DesignatedInitializer
ruleDesignatedInitializer:
	ruleDesignator
	+
	'='
	ruleInitializer
;

// Rule Designator
ruleDesignator:
	(
		'['
		ruleConstantExpression
		']'
		    |
		'.'
		RULE_ID
	)
;

// Rule AbstractDeclarator
ruleAbstractDeclarator:
	ruleDirectAbstractDeclarator
;

// Rule DirectAbstractDeclarator
ruleDirectAbstractDeclarator:
	(
		'('
		(
			ruleAbstractDeclarator
			?
			    |
			ruleParameterList
		)
		')'
		    |
		'['
		ruleConstantExpression
		?
		']'
	)
;

// Rule Expression
ruleExpression:
	ruleAssignmentExpression
	(
		','
		ruleAssignmentExpression
	)?
;

// Rule AssignmentExpression
ruleAssignmentExpression:
	rulePrefixExpression
	(
		(
			'='
			    |
			'*='
			    |
			'/='
			    |
			'%='
			    |
			'+='
			    |
			'-='
			    |
			'<<='
			    |
			'>>='
			    |
			'&='
			    |
			'^='
			    |
			'|='
		)
		ruleConditionalExpression
	)+
;

// Rule ConditionalExpression
ruleConditionalExpression:
	ruleLogicalOrExpression
	(
		'?'
		ruleConditionalExpression
		':'
		ruleConditionalExpression
	)?
;

// Rule LogicalOrExpression
ruleLogicalOrExpression:
	ruleLogicalAndExpression
	(
		'||'
		ruleLogicalOrExpression
	)?
;

// Rule LogicalAndExpression
ruleLogicalAndExpression:
	ruleInclusiveOrExpression
	(
		'&&'
		ruleLogicalAndExpression
	)?
;

// Rule InclusiveOrExpression
ruleInclusiveOrExpression:
	ruleExclusiveOrExpression
	(
		'|'
		ruleInclusiveOrExpression
	)?
;

// Rule ExclusiveOrExpression
ruleExclusiveOrExpression:
	ruleAndExpression
	(
		'^'
		ruleExclusiveOrExpression
	)?
;

// Rule AndExpression
ruleAndExpression:
	ruleEqualityExpression
	(
		'&'
		ruleAndExpression
	)?
;

// Rule EqualityExpression
ruleEqualityExpression:
	ruleRelationalExpression
	(
		(
			'=='
			    |
			'!='
		)
		ruleEqualityExpression
	)?
;

// Rule RelationalExpression
ruleRelationalExpression:
	ruleShiftExpression
	(
		(
			'<'
			    |
			'>'
			    |
			'<='
			    |
			'>='
		)
		ruleRelationalExpression
	)?
;

// Rule ShiftExpression
ruleShiftExpression:
	ruleAdditiveExpression
	(
		(
			'<<'
			    |
			'>>'
		)
		ruleShiftExpression
	)?
;

// Rule AdditiveExpression
ruleAdditiveExpression:
	ruleMultiplicativeExpression
	(
		(
			'+'
			    |
			'-'
		)
		ruleAdditiveExpression
	)?
;

// Rule MultiplicativeExpression
ruleMultiplicativeExpression:
	ruleCastExpression
	(
		(
			'*'
			    |
			'/'
			    |
			'%'
		)
		ruleMultiplicativeExpression
	)?
;

// Rule CastExpression
ruleCastExpression:
	(
		rulePrefixExpression
		    |
		'('
		ruleDataTypeSpecifier
		')'
		ruleCastExpression
	)
;

// Rule PrefixExpression
rulePrefixExpression:
	(
		rulePostfixExpression
		    |
		'++'
		rulePrefixExpression
		    |
		'--'
		rulePrefixExpression
		    |
		ruleUnaryOperator
		ruleCastExpression
		    |
		'sizeof'
		'('
		(
			rulePostfixExpression
			    |
			ruleDataTypeSpecifier
		)
		')'
	)
;

// Rule UnaryOperator
ruleUnaryOperator:
	(
		'&'
		    |
		'*'
		    |
		'+'
		    |
		'-'
		    |
		'~'
		    |
		'!'
	)
;

// Rule PostfixExpression
rulePostfixExpression:
	rulePrimaryExpression
	(
		rulePostfixOperator
	)*
;

// Rule PostfixOperator
rulePostfixOperator:
	(
		'['
		ruleConditionalExpression
		(
			':'
			ruleConditionalExpression
		)?
		']'
		    |
		'('
		(
			ruleConditionalExpression
			(
				','
				ruleConditionalExpression
			)*
		)?
		')'
		    |
		'.'
		RULE_ID
		    |
		'->'
		RULE_ID
		    |
		'++'
		    |
		'--'
	)
;

// Rule PrimaryExpression
rulePrimaryExpression:
	(
		RULE_ID
		    |
		ruleConstant
		    |
		ruleStringLiteral
		+
		    |
		'('
		ruleConditionalExpression
		')'
	)
;

// Rule StringLiteral
ruleStringLiteral:
	ruleEncodingPrefix?
	RULE_STRING
;

// Rule EncodingPrefix
ruleEncodingPrefix:
	(
		'u8'
		    |
		'u'
		    |
		'U'
		    |
		'L'
	)
;

// Rule ConstantExpression
ruleConstantExpression:
	ruleConditionalExpression
;

// Rule Constant
ruleConstant:
	(
		ruleIntegerConstant
		    |
		ruleFloatingConstant
		    |
		ruleCharacterConstant
		    |
		ruleBoolConstant
	)
;

// Rule IntegerConstant
ruleIntegerConstant:
	RULE_INTEGER
	ruleIntegerSuffix?
;

// Rule FloatingConstant
ruleFloatingConstant:
	RULE_FLOAT
	ruleFloatingSuffix?
;

// Rule BoolConstant
ruleBoolConstant:
	RULE_BOOLEAN
;

// Rule IntegerSuffix
ruleIntegerSuffix:
	(
		ruleUnsignedSuffix
		ruleLongSuffix?
		    |
		ruleUnsignedSuffix
		ruleLongLongSuffix
		    |
		ruleLongSuffix
		ruleUnsignedSuffix?
		    |
		ruleLongLongSuffix
		ruleUnsignedSuffix?
	)
;

// Rule UnsignedSuffix
ruleUnsignedSuffix:
	(
		'u'
		    |
		'U'
	)
;

// Rule LongSuffix
ruleLongSuffix:
	(
		'l'
		    |
		'L'
	)
;

// Rule LongLongSuffix
ruleLongLongSuffix:
	(
		'll'
		    |
		'LL'
	)
;

// Rule FloatingSuffix
ruleFloatingSuffix:
	(
		'f'
		    |
		'l'
		    |
		'F'
		    |
		'L'
	)
;

// Rule CharacterConstant
ruleCharacterConstant:
	(
		RULE_CHARCONST
		    |
		'L'
		RULE_CHARCONST
		    |
		'u'
		RULE_CHARCONST
		    |
		'U'
		RULE_CHARCONST
	)
;

// Rule DataTypes
ruleDataTypes:
	(
		'bool'
		    |
		'char'
		    |
		'short'
		    |
		'int'
		    |
		'long'
		    |
		'signed'
		    |
		'unsigned'
		    |
		'float'
		    |
		'double'
		    |
		'frac'
		    |
		'accum'
	)
;

// Rule TypeQualifier
ruleTypeQualifier:
	(
		'const'
		    |
		'volatile'
	)
;

// Rule StorageClassSpecifier
ruleStorageClassSpecifier:
	(
		'extern'
		    |
		'static'
	)
;

// Rule Attribute
ruleAttribute:
	(
		'NONE'
		    |
		'is_pc'
		    |
		'delete'
	)
;

// Rule InstrAttribute
ruleInstrAttribute:
	(
		'NONE'
		    |
		'no_cont'
		    |
		'cond'
		    |
		'flush'
	)
;

// Rule StructOrUnion
ruleStructOrUnion:
	(
		'struct'
		    |
		'union'
	)
;

// Rule BitfieldDataType
ruleBitfieldDataType:
	(
		'u'
		    |
		's'
	)
;

RULE_BVAL : 'b' ('0'..'9')+;

RULE_BOOLEAN : ('true'|'false');

RULE_FLOAT : ('0'..'9')+ '.' ('0'..'9')* (('e'|'E') ('+'|'-')? ('0'..'9')+)?;

RULE_INTEGER : (RULE_DECIMALCONSTANT|RULE_BINARYCONSTANT|RULE_HEXADECIMALCONSTANT|RULE_OCTALCONSTANT|RULE_VLOGCONSTANT);

fragment RULE_BINARYCONSTANT : ('0b'|'0B') '0'..'1' ('_'? '0'..'1')*;

fragment RULE_OCTALCONSTANT : '0' '_'? '0'..'7' ('_'? '0'..'7')*;

fragment RULE_DECIMALCONSTANT : ('0'|'1'..'9' ('_'? '0'..'9')*);

fragment RULE_HEXADECIMALCONSTANT : ('0x'|'0X') ('0'..'9'|'a'..'f'|'A'..'F') ('_'? ('0'..'9'|'a'..'f'|'A'..'F'))*;

fragment RULE_VLOGCONSTANT : ('0'..'9')+ '\'' ('b' '01'+|'o' ('0'..'7')+|'d' ('0'..'9')+|'h' ('0'..'9'|'a'..'f'|'A'..'F')+);

RULE_CHARCONST : '\'' ('\\' .|~(('\\'|'\'')))* '\'';

RULE_INT : 'this one has been deactivated';

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_STRING : '"' ('\\' .|~(('\\'|'"')))* '"';

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/' {skip();};

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')? {skip();};

RULE_WS : (' '|'\t'|'\r'|'\n')+ {skip();};

RULE_ANY_OTHER : .;
