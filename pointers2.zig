const std = @import("std");

pub fn main() void {
    var name = [4]u8{'G', 'o', 'k', 'u'};
    const user1 = User{
        .id = 1,
        .power = 100,
        .name = name[0..], // slice it [4]u8 -> []u8
    };
    levelUp(user1);
    std.debug.print("{s}\n", .{user1.name});
}

fn levelUp(user: User) void {
    user.name[2] = '!';
}

pub const User = struct {
    id: u64,
    power: i32,
    name: []u8, // []const u8 -> u8
};