// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

fn Foo(a: i32, b: i32) -> auto {
  returned var ret: i32 = a + b;
  if (b == a) {
    ret = b - a;
    return var;
  }
  ret = a - b;
  // CHECK:STDERR: COMPILATION ERROR: fail_returned_var_multi_auto.carbon:[[@LINE+1]]: Only one return is allowed in a function with an `auto` return type.
  return var;
}

fn Main() -> i32 {
  return Foo(1, 2);
}
