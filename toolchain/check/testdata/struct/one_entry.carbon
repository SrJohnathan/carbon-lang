// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/struct/one_entry.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/struct/one_entry.carbon

var x: {.a: i32} = {.a = 4};
var y: {.a: i32} = x;

// CHECK:STDOUT: --- one_entry.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %int_32: Core.IntLiteral = int_value 32 [template]
// CHECK:STDOUT:   %i32: type = class_type @Int, @Int(%int_32) [template]
// CHECK:STDOUT:   %struct_type.a.ba9: type = struct_type {.a: %i32} [template]
// CHECK:STDOUT:   %int_4.0c1: Core.IntLiteral = int_value 4 [template]
// CHECK:STDOUT:   %struct_type.a.a6c: type = struct_type {.a: Core.IntLiteral} [template]
// CHECK:STDOUT:   %Convert.type.1b6: type = fn_type @Convert.1, @ImplicitAs(%i32) [template]
// CHECK:STDOUT:   %impl_witness.d39: <witness> = impl_witness (imports.%Core.import_ref.a5b), @impl.1(%int_32) [template]
// CHECK:STDOUT:   %Convert.type.035: type = fn_type @Convert.2, @impl.1(%int_32) [template]
// CHECK:STDOUT:   %Convert.956: %Convert.type.035 = struct_value () [template]
// CHECK:STDOUT:   %Convert.bound: <bound method> = bound_method %int_4.0c1, %Convert.956 [template]
// CHECK:STDOUT:   %Convert.specific_fn: <specific function> = specific_function %Convert.bound, @Convert.2(%int_32) [template]
// CHECK:STDOUT:   %int_4.940: %i32 = int_value 4 [template]
// CHECK:STDOUT:   %struct: %struct_type.a.ba9 = struct_value (%int_4.940) [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     .Int = %Core.Int
// CHECK:STDOUT:     .ImplicitAs = %Core.ImplicitAs
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/...
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .x = %x
// CHECK:STDOUT:     .y = %y
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   name_binding_decl {
// CHECK:STDOUT:     %x.patt: %struct_type.a.ba9 = binding_pattern x
// CHECK:STDOUT:     %.loc11_1: %struct_type.a.ba9 = var_pattern %x.patt
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %x.var: ref %struct_type.a.ba9 = var x
// CHECK:STDOUT:   %.loc11_16: type = splice_block %struct_type.a.loc11 [template = constants.%struct_type.a.ba9] {
// CHECK:STDOUT:     %int_32.loc11: Core.IntLiteral = int_value 32 [template = constants.%int_32]
// CHECK:STDOUT:     %i32.loc11: type = class_type @Int, @Int(constants.%int_32) [template = constants.%i32]
// CHECK:STDOUT:     %struct_type.a.loc11: type = struct_type {.a: %i32} [template = constants.%struct_type.a.ba9]
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %x: ref %struct_type.a.ba9 = bind_name x, %x.var
// CHECK:STDOUT:   name_binding_decl {
// CHECK:STDOUT:     %y.patt: %struct_type.a.ba9 = binding_pattern y
// CHECK:STDOUT:     %.loc12_1: %struct_type.a.ba9 = var_pattern %y.patt
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %y.var: ref %struct_type.a.ba9 = var y
// CHECK:STDOUT:   %.loc12_16: type = splice_block %struct_type.a.loc12 [template = constants.%struct_type.a.ba9] {
// CHECK:STDOUT:     %int_32.loc12: Core.IntLiteral = int_value 32 [template = constants.%int_32]
// CHECK:STDOUT:     %i32.loc12: type = class_type @Int, @Int(constants.%int_32) [template = constants.%i32]
// CHECK:STDOUT:     %struct_type.a.loc12: type = struct_type {.a: %i32} [template = constants.%struct_type.a.ba9]
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %y: ref %struct_type.a.ba9 = bind_name y, %y.var
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @__global_init() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %int_4: Core.IntLiteral = int_value 4 [template = constants.%int_4.0c1]
// CHECK:STDOUT:   %.loc11_27.1: %struct_type.a.a6c = struct_literal (%int_4)
// CHECK:STDOUT:   %impl.elem0: %Convert.type.1b6 = impl_witness_access constants.%impl_witness.d39, element0 [template = constants.%Convert.956]
// CHECK:STDOUT:   %Convert.bound: <bound method> = bound_method %int_4, %impl.elem0 [template = constants.%Convert.bound]
// CHECK:STDOUT:   %Convert.specific_fn: <specific function> = specific_function %Convert.bound, @Convert.2(constants.%int_32) [template = constants.%Convert.specific_fn]
// CHECK:STDOUT:   %int.convert_checked: init %i32 = call %Convert.specific_fn(%int_4) [template = constants.%int_4.940]
// CHECK:STDOUT:   %.loc11_27.2: init %i32 = converted %int_4, %int.convert_checked [template = constants.%int_4.940]
// CHECK:STDOUT:   %.loc11_27.3: init %struct_type.a.ba9 = struct_init (%.loc11_27.2) to file.%x.var [template = constants.%struct]
// CHECK:STDOUT:   %.loc11_1: init %struct_type.a.ba9 = converted %.loc11_27.1, %.loc11_27.3 [template = constants.%struct]
// CHECK:STDOUT:   assign file.%x.var, %.loc11_1
// CHECK:STDOUT:   %x.ref: ref %struct_type.a.ba9 = name_ref x, file.%x
// CHECK:STDOUT:   %.loc12_20.1: ref %i32 = struct_access %x.ref, element0
// CHECK:STDOUT:   %.loc12_20.2: %i32 = bind_value %.loc12_20.1
// CHECK:STDOUT:   %.loc12_20.3: init %struct_type.a.ba9 = struct_init (%.loc12_20.2) to file.%y.var
// CHECK:STDOUT:   %.loc12_1: init %struct_type.a.ba9 = converted %x.ref, %.loc12_20.3
// CHECK:STDOUT:   assign file.%y.var, %.loc12_1
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
