const std = @import("std");

// pub fn main() void {
//     var user = User{
//         .id = 1,
//         .power = 100,
//     };
//     user.power += 0;
    
//     levelUp(user);
//     std.debug.print("User {d} has power of {d}\n", .{ user.id, user.power });
// }

pub fn main() void {
    var user = User{
        .id = 1,
        .power = 100,
    };
    std.debug.print("{*}\n{*}\n{*}\n", .{&user, &user.id, &user.power});
    // pointers.User@16b092a60
    // u64@16b092a60
    // i32@16b092a68
}

fn levelUp(user: User) void {
    var u = user;
    u.power += 1;
}

pub const User = struct {
    id: u64,
    power: i32,
};