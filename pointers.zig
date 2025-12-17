const std = @import("std");

pub fn main() void {
    var user = User{
        .id = 1,
        .power = 100,
    };
    user.power += 0;
    
    levelUp(user);
    std.debug.print("User {d} has power of {d}\n", .{ user.id, user.power });
}

fn levelUp(user: User) void {
    var u = user;
    u.power += 1;
}

pub const User = struct {
    id: u64,
    power: i32,
};