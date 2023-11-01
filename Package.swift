// swift-tools-version: 5.7
import PackageDescription

// Custom linker settings are required because Windows doesn't support pkg-config.
#if os(Windows)
let customLinkerSettings: [LinkerSetting]? = [
.linkedLibrary("LLVM-C"), .linkedLibrary("lldCOFF"), .linkedLibrary("lldCommon"),
.linkedLibrary("lldELF"), .linkedLibrary("lldMachO"), .linkedLibrary("lldMinGW"),
.linkedLibrary("lldWasm"), .linkedLibrary("LLVMAArch64AsmParser"),
.linkedLibrary("LLVMAArch64CodeGen"), .linkedLibrary("LLVMAArch64Desc"),
.linkedLibrary("LLVMAArch64Disassembler"), .linkedLibrary("LLVMAArch64Info"),
.linkedLibrary("LLVMAArch64Utils"), .linkedLibrary("LLVMAggressiveInstCombine"),
.linkedLibrary("LLVMAMDGPUAsmParser"), .linkedLibrary("LLVMAMDGPUCodeGen"),
.linkedLibrary("LLVMAMDGPUDesc"), .linkedLibrary("LLVMAMDGPUDisassembler"),
.linkedLibrary("LLVMAMDGPUInfo"), .linkedLibrary("LLVMAMDGPUTargetMCA"),
.linkedLibrary("LLVMAMDGPUUtils"), .linkedLibrary("LLVMAnalysis"),
.linkedLibrary("LLVMARMAsmParser"), .linkedLibrary("LLVMARMCodeGen"),
.linkedLibrary("LLVMARMDesc"), .linkedLibrary("LLVMARMDisassembler"),
.linkedLibrary("LLVMARMInfo"), .linkedLibrary("LLVMARMUtils"),
.linkedLibrary("LLVMAsmParser"), .linkedLibrary("LLVMAsmPrinter"),
.linkedLibrary("LLVMAVRAsmParser"), .linkedLibrary("LLVMAVRCodeGen"),
.linkedLibrary("LLVMAVRDesc"), .linkedLibrary("LLVMAVRDisassembler"),
.linkedLibrary("LLVMAVRInfo"), .linkedLibrary("LLVMBinaryFormat"),
.linkedLibrary("LLVMBitReader"), .linkedLibrary("LLVMBitstreamReader"),
.linkedLibrary("LLVMBitWriter"), .linkedLibrary("LLVMBPFAsmParser"),
.linkedLibrary("LLVMBPFCodeGen"), .linkedLibrary("LLVMBPFDesc"),
.linkedLibrary("LLVMBPFDisassembler"), .linkedLibrary("LLVMBPFInfo"),
.linkedLibrary("LLVMCFGuard"), .linkedLibrary("LLVMCFIVerify"),
.linkedLibrary("LLVMCodeGen"), .linkedLibrary("LLVMCore"),
.linkedLibrary("LLVMCoroutines"), .linkedLibrary("LLVMCoverage"),
.linkedLibrary("LLVMDebugInfoCodeView"), .linkedLibrary("LLVMDebuginfod"),
.linkedLibrary("LLVMDebugInfoDWARF"), .linkedLibrary("LLVMDebugInfoGSYM"),
.linkedLibrary("LLVMDebugInfoMSF"), .linkedLibrary("LLVMDebugInfoPDB"),
.linkedLibrary("LLVMDemangle"), .linkedLibrary("LLVMDiff"),
.linkedLibrary("LLVMDlltoolDriver"), .linkedLibrary("LLVMDWARFLinker"),
.linkedLibrary("LLVMDWP"), .linkedLibrary("LLVMExecutionEngine"),
.linkedLibrary("LLVMExegesis"), .linkedLibrary("LLVMExegesisAArch64"),
.linkedLibrary("LLVMExegesisMips"), .linkedLibrary("LLVMExegesisPowerPC"),
.linkedLibrary("LLVMExegesisX86"), .linkedLibrary("LLVMExtensions"),
.linkedLibrary("LLVMFileCheck"), .linkedLibrary("LLVMFrontendOpenACC"),
.linkedLibrary("LLVMFrontendOpenMP"), .linkedLibrary("LLVMFuzzerCLI"),
.linkedLibrary("LLVMFuzzMutate"), .linkedLibrary("LLVMGlobalISel"),
.linkedLibrary("LLVMHexagonAsmParser"), .linkedLibrary("LLVMHexagonCodeGen"),
.linkedLibrary("LLVMHexagonDesc"), .linkedLibrary("LLVMHexagonDisassembler"),
.linkedLibrary("LLVMHexagonInfo"), .linkedLibrary("LLVMInstCombine"),
.linkedLibrary("LLVMInstrumentation"), .linkedLibrary("LLVMInterfaceStub"),
.linkedLibrary("LLVMInterpreter"), .linkedLibrary("LLVMipo"),
.linkedLibrary("LLVMIRReader"), .linkedLibrary("LLVMJITLink"),
.linkedLibrary("LLVMLanaiAsmParser"), .linkedLibrary("LLVMLanaiCodeGen"),
.linkedLibrary("LLVMLanaiDesc"), .linkedLibrary("LLVMLanaiDisassembler"),
.linkedLibrary("LLVMLanaiInfo"), .linkedLibrary("LLVMLibDriver"),
.linkedLibrary("LLVMLineEditor"), .linkedLibrary("LLVMLinker"),
.linkedLibrary("LLVMLTO"), .linkedLibrary("LLVMMC"), .linkedLibrary("LLVMMCA"),
.linkedLibrary("LLVMMCDisassembler"), .linkedLibrary("LLVMMCJIT"),
.linkedLibrary("LLVMMCParser"), .linkedLibrary("LLVMMipsAsmParser"),
.linkedLibrary("LLVMMipsCodeGen"), .linkedLibrary("LLVMMipsDesc"),
.linkedLibrary("LLVMMipsDisassembler"), .linkedLibrary("LLVMMipsInfo"),
.linkedLibrary("LLVMMIRParser"), .linkedLibrary("LLVMMSP430AsmParser"),
.linkedLibrary("LLVMMSP430CodeGen"), .linkedLibrary("LLVMMSP430Desc"),
.linkedLibrary("LLVMMSP430Disassembler"), .linkedLibrary("LLVMMSP430Info"),
.linkedLibrary("LLVMNVPTXCodeGen"), .linkedLibrary("LLVMNVPTXDesc"),
.linkedLibrary("LLVMNVPTXInfo"), .linkedLibrary("LLVMObjCARCOpts"),
.linkedLibrary("LLVMObjCopy"), .linkedLibrary("LLVMObject"),
.linkedLibrary("LLVMObjectYAML"), .linkedLibrary("LLVMOption"),
.linkedLibrary("LLVMOrcJIT"), .linkedLibrary("LLVMOrcShared"),
.linkedLibrary("LLVMOrcTargetProcess"), .linkedLibrary("LLVMPasses"),
.linkedLibrary("LLVMPowerPCAsmParser"), .linkedLibrary("LLVMPowerPCCodeGen"),
.linkedLibrary("LLVMPowerPCDesc"), .linkedLibrary("LLVMPowerPCDisassembler"),
.linkedLibrary("LLVMPowerPCInfo"), .linkedLibrary("LLVMProfileData"),
.linkedLibrary("LLVMRemarks"), .linkedLibrary("LLVMRISCVAsmParser"),
.linkedLibrary("LLVMRISCVCodeGen"), .linkedLibrary("LLVMRISCVDesc"),
.linkedLibrary("LLVMRISCVDisassembler"), .linkedLibrary("LLVMRISCVInfo"),
.linkedLibrary("LLVMRuntimeDyld"), .linkedLibrary("LLVMScalarOpts"),
.linkedLibrary("LLVMSelectionDAG"), .linkedLibrary("LLVMSparcAsmParser"),
.linkedLibrary("LLVMSparcCodeGen"), .linkedLibrary("LLVMSparcDesc"),
.linkedLibrary("LLVMSparcDisassembler"), .linkedLibrary("LLVMSparcInfo"),
.linkedLibrary("LLVMSupport"), .linkedLibrary("LLVMSymbolize"),
.linkedLibrary("LLVMSystemZAsmParser"), .linkedLibrary("LLVMSystemZCodeGen"),
.linkedLibrary("LLVMSystemZDesc"), .linkedLibrary("LLVMSystemZDisassembler"),
.linkedLibrary("LLVMSystemZInfo"), .linkedLibrary("LLVMTableGen"),
.linkedLibrary("LLVMTableGenGlobalISel"), .linkedLibrary("LLVMTarget"),
.linkedLibrary("LLVMTextAPI"), .linkedLibrary("LLVMTransformUtils"),
.linkedLibrary("LLVMVEAsmParser"), .linkedLibrary("LLVMVECodeGen"),
.linkedLibrary("LLVMVectorize"), .linkedLibrary("LLVMVEDesc"),
.linkedLibrary("LLVMVEDisassembler"), .linkedLibrary("LLVMVEInfo"),
.linkedLibrary("LLVMWebAssemblyAsmParser"), .linkedLibrary("LLVMWebAssemblyCodeGen"),
.linkedLibrary("LLVMWebAssemblyDesc"), .linkedLibrary("LLVMWebAssemblyDisassembler"),
.linkedLibrary("LLVMWebAssemblyInfo"), .linkedLibrary("LLVMWebAssemblyUtils"),
.linkedLibrary("LLVMWindowsDriver"), .linkedLibrary("LLVMWindowsManifest"),
.linkedLibrary("LLVMX86AsmParser"), .linkedLibrary("LLVMX86CodeGen"),
.linkedLibrary("LLVMX86Desc"), .linkedLibrary("LLVMX86Disassembler"),
.linkedLibrary("LLVMX86Info"), .linkedLibrary("LLVMX86TargetMCA"),
.linkedLibrary("LLVMXCoreCodeGen"), .linkedLibrary("LLVMXCoreDesc"),
.linkedLibrary("LLVMXCoreDisassembler"), .linkedLibrary("LLVMXCoreInfo"),
.linkedLibrary("LLVMXRay"), .linkedLibrary("LTO"), .linkedLibrary("Remarks")]
#else
let customLinkerSettings: [LinkerSetting]? = nil
#endif

let swiftSettings: [SwiftSetting] = [
  .unsafeFlags(["-warnings-as-errors", "-strict-concurrency=complete", "-warn-concurrency"]),
]

let package = Package(
  name: "Swifty-LLVM",
  products: [
    .library(name: "LLVM", targets: ["LLVM"]),
  ],
  targets: [
    // LLVM API Wrappers.
    .target(
      name: "LLVM",
      dependencies: ["llvmc", "llvmshims"],
      swiftSettings: swiftSettings,
      linkerSettings: customLinkerSettings),
    .target(
      name: "llvmshims",
      dependencies: ["llvmc"],
      swiftSettings: swiftSettings,
      linkerSettings: customLinkerSettings),

    // Tests.
    .testTarget(name: "LLVMTests", dependencies: ["LLVM"]),

    // LLVM's C API
    .systemLibrary(name: "llvmc", pkgConfig: "llvm"),
  ],
  cxxLanguageStandard: .cxx20)
