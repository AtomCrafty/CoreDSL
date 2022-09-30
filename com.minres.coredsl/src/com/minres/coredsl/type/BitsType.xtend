package com.minres.coredsl.type

import org.eclipse.xtend.lib.annotations.Data

@Data
class BitsType extends CoreDslType {
	
	new(int bitSize) {
		super(bitSize);
	}

	override isPrimitiveType() { return true; }
	
	override toString() { return '''bits<«bitSize»>'''; }
}
