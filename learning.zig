const std = @import("std");
const User = @import("models/user.zig").User;

// This code won't compile if `main` isn't `pub`
pub fn main() void {
    const user = User{
        .power = 9001,
        .name = "Goku",
    };

    std.debug.print(" {s}'s power is {d}", .{ user.name, user.power });
}
