// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

class A {}

fn Main() -> i32 {
  var a: A = {};
  // CHECK:STDERR: COMPILATION ERROR: fail_no_negate.carbon:[[@LINE+2]]: type error in `-`:
  // CHECK:STDERR: could not find implementation of interface Negate for class A
  -a;
  return 0;
}
