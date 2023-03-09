import llvmc

/// The type of a value in LLVM IR.
internal struct AnyType: IRType, Hashable {

  /// A handle to the LLVM object wrapped by this instance.
  public let llvm: LLVMTypeRef

  /// Creates an instance wrapping `llvm`.
  ///
  /// - Requires: `bitWidth` is greater than 0.
  internal init(_ llvm: LLVMTypeRef) {
    self.llvm = llvm
  }

}
