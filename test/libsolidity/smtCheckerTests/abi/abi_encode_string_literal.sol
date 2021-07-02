contract C {
	function abiEncodeStringLiteral() public pure {
		bytes memory b1 = abi.encode("");
		bytes memory b2 = abi.encode("");
		// should hold, but currently fails due to string literal abstraction
		assert(b1.length == b2.length);

		bytes memory b3 = abi.encode(bytes(""));
		assert(b1.length == b3.length); // should fail

		bytes memory b4 = abi.encode(bytes24(""));
		// should hold, but currently fails due to string literal abstraction
		assert(b1.length == b4.length);

		bytes memory b5 = abi.encode(string(""));
		assert(b1.length == b5.length); // should fail
	}
}
// ====
// SMTEngine: all
