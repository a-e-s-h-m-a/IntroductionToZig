const std = @import("std");
const userModel = @import("models/user.zig");
const User = userModel.User;
const MAX_POWER = userModel.MAX_POWER;

// This code won't compile if `main` isn't `pub`
pub fn main() void {
    const user = User{
        .power = 9001,
        .name = "Goku",
    };

    std.debug.print(" {s}'s power is {d}\n", .{ user.name, user.power });
    user.diagnose();
    User.diagnose(user);

    //-----------------
    // const a = [5]i32{ 1, 2, 3, 4, 5 };
    // we already saw this .{...} syntax with structs
    // it works with arrays too
    // const b: [5]i32 = .{ 1, 2, 3, 4, 5 };

    // use _ to let the compiler infer the length
    // const c = [_]i32{ 1, 2, 3, 4, 5 };

    //-----------------
    //const b_non_slice = a[1..4];

    // easy way to get a slice from an array
    //const d_slice: []const i32 = c[1..4];

    // hard way
    // because `end` is declared var, it isn't compiled-time known
    //var end: usize = 3;

    // but because it's a `var` we need to mutate it, else the compiler will insist we make it `const`
    // end += 1;
    //If we had done const end: usize = 4 without the increment,
    // then 1..end would have become a compile-time known length
    // for b and thus created a pointer to an array, not a slice.
    // I find this a little confusing, but it isn't something that
    // comes up too often and it isn't too hard to master.
    // I would have loved to skip over it at this point,
    // but couldn't figure out an honest way to avoid this detail.
    //const d_slice2 = a[1..end];
    //std.debug.print("{any}\n", .{@TypeOf(d_slice2)});
    //
    //    const a = [_]i32{1, 2, 3, 4, 5};
    // var end: usize = 4;
    // end += 1;
    // var b = a[1..end]; // type - []const i32
    // std.debug.print("{any}\n", .{@TypeOf(b)});
    // b[2] = 5; // Error -> b's type []const i32
    //
    //

    // This works
    // var a = [_]i32{1, 2, 3, 4, 5};
    // var end: usize = 3;
    // end += 1;
    // const b = a[1..end];
    // b[2] = 99;

    // var a = [_]i32{1, 2, 3, 4, 5};
    // var end: usize = 3;
    // end += 1;
    // const b = a[1..end];
    // b = b[1..]; // Error b is a const
    //
    const a = [3:false]bool{ false, true, false };
    std.debug.print("{any}\n", .{std.mem.asBytes(&a)});

    //var i = 0; // comptime_int
    //var i: usize = 0;
    std.debug.print("{}\n", .{.{ .year = 2023, .month = 8 }});
}

const testing = std.testing;
test "IntList: add" {
    try std.testing.expectEqual(false, false);
}
