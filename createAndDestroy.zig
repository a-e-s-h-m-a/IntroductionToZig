const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    const allocator = gpa.allocator();
    
    //Create User in the Heap
    var user = try allocator.create(User);
    //Free allocated memory
    defer allocator.destroy(user);
   
    user.id = 1;
    user.power = 100; 
    
    levelUp(user);
    std.debug.print("User {d} has power of {d}\n", .{user.id, user.power});
}

fn levelUp(user: *User) void {
    user.power += 1;
}

pub const User = struct {
	id: u64,
	power: i32,
};