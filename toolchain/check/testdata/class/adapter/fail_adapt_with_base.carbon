// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/class/adapter/fail_adapt_with_base.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/class/adapter/fail_adapt_with_base.carbon
class Simple {};
base class AdaptWithVirtual {
  virtual fn F();
  // CHECK:STDERR: fail_adapt_with_base.carbon:[[@LINE+7]]:3: error: adapter with virtual function [AdaptWithVirtual]
  // CHECK:STDERR:   adapt Simple;
  // CHECK:STDERR:   ^~~~~~~~~~~~~
  // CHECK:STDERR: fail_adapt_with_base.carbon:[[@LINE-4]]:3: note: first virtual function declaration is here [AdaptWithVirtualHere]
  // CHECK:STDERR:   virtual fn F();
  // CHECK:STDERR:   ^~~~~~~~~~~~~~~
  // CHECK:STDERR:
  adapt Simple;
}

// CHECK:STDOUT: --- fail_adapt_with_base.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Simple: type = class_type @Simple [template]
// CHECK:STDOUT:   %empty_struct_type: type = struct_type {} [template]
// CHECK:STDOUT:   %complete_type: <witness> = complete_type_witness %empty_struct_type [template]
// CHECK:STDOUT:   %AdaptWithVirtual: type = class_type @AdaptWithVirtual [template]
// CHECK:STDOUT:   %F.type: type = fn_type @F [template]
// CHECK:STDOUT:   %F: %F.type = struct_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/...
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .Simple = %Simple.decl
// CHECK:STDOUT:     .AdaptWithVirtual = %AdaptWithVirtual.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %Simple.decl: type = class_decl @Simple [template = constants.%Simple] {} {}
// CHECK:STDOUT:   %AdaptWithVirtual.decl: type = class_decl @AdaptWithVirtual [template = constants.%AdaptWithVirtual] {} {}
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Simple {
// CHECK:STDOUT:   %complete_type: <witness> = complete_type_witness %empty_struct_type [template = constants.%complete_type]
// CHECK:STDOUT:   complete_type_witness = %complete_type
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%Simple
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @AdaptWithVirtual {
// CHECK:STDOUT:   %F.decl: %F.type = fn_decl @F [template = constants.%F] {} {}
// CHECK:STDOUT:   %Simple.ref: type = name_ref Simple, file.%Simple.decl [template = constants.%Simple]
// CHECK:STDOUT:   adapt_decl %Simple.ref [template]
// CHECK:STDOUT:   complete_type_witness = <error>
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%AdaptWithVirtual
// CHECK:STDOUT:   .F = %F.decl
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: virtual fn @F();
// CHECK:STDOUT:
