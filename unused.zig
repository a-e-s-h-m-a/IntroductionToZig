const std = @import("std");

pub fn main() void {
    _ = add(8999, 2);
}

fn add(a: i64, _: i64) i64 {
    return a + a;
}