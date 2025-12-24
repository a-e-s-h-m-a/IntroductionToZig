const std = @import("std");

pub fn main() !void {
    var arr: IntArray(3) = undefined;
    arr[0] = 1;
    arr[1] = 10;
    arr[2] = 1000;
    std.debug.print("{any}\n", .{arr});
}

fn IntArray(comptime length: usize) type {
    return [length]i64;
}