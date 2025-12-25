const std = @import("std");

const User = struct {
    power: i32,
};

pub fn main() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    const allocator = gpa.allocator();
    
    var lookup = std.StringHashMap(User).init(allocator);
    defer lookup.deinit();
    
    const goku = User { .power = 9001 };
    
    try lookup.put("Goku", goku);
    
    // returns an optional
    const entry = lookup.getPtr("Goku").?;
    std.debug.print("Goku's power is {d}\n", .{entry.power});
    
    _ = lookup.remove("Goku");
    std.debug.print("Goku's power is {d}\n", .{entry.power});
}