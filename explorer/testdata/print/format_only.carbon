// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn Main() -> i32 {
  var s: auto = "Hello world!";
  Print(s);
  return 0;
}

// CHECK:STDOUT: Hello world!
// CHECK:STDOUT: result: 0
