const std = @import("std");
const builtin = @import("builtin");
const Allocator = std.mem.Allocator;

pub fn main() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    const allocator = gpa.allocator();
    
    var arr: std.ArrayList(User) = .empty;
    defer {
        for(arr.items) |user| {
            user.deinit(allocator);
        }
        arr.deinit(allocator);
    }
    
    var buf: [30]u8 = undefined;
    var stdin = std.fs.File.stdin().reader(&buf);
    var stdout = std.fs.File.stdout().writer(&.{});
    
    var i: i32 = 0;
    while (true) : (i += 1) {
        try stdout.interface.print("Pls enter a name: ", .{});
        const name = try stdin.interface.takeDelimiterExclusive('\n');
        stdin.interface.toss(1);
        
        if(name.len == 0) {
            break;
        }
        
        const owned_name = try allocator.dupe(u8, name);
        try arr.append(allocator, .{ .name = owned_name, .power = i });
    }
    
    var has_leto = false;
    for(arr.items) |user| {
        if(std.mem.eql(u8, "Leto", user.name)) {
            has_leto = true;
            break;
        }
    }
    std.debug.print("{any}\n", .{ has_leto });
}

const User = struct {
    name: []const u8,
    power: i32,
    
    fn deinit(self: User, allocator: Allocator) void {
        allocator.free(self.name);
    }
};