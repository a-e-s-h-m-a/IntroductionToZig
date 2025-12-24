const std = @import("std");

pub fn main() !void {
    var buf: [150]u8 = undefined;
    var fa = std.heap.FixedBufferAllocator.init(&buf);
    
    //This will free all the memory allocated with this allocator
    defer fa.reset();
    
    const allocator = fa.allocator();
    
    const json = try std.json.Stringify.valueAlloc(allocator, .{
        .this_is = "anonymouse struct",
        .above = true,
        .last_param = "are optional",
    }, .{ .whitespace = .indent_2 });
    
    // We can free this allocation, but since we know that our allocator is
	// a FixedBufferAllocator, we can rely on the above `defer fa.reset()`
	defer allocator.free(json);
	
	std.debug.print("{s}\n", .{json});
}