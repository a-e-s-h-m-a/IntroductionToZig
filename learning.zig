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
}
