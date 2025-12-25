const std = @import("std");
const builtin = @import("builtin");

const User = struct {
    power: i32,
};

// pub fn main() !void {
//     var gpa = std.heap.DebugAllocator(.{}){};
//     const allocator = gpa.allocator();
    
//     var lookup = std.StringHashMap(*const User).init(allocator);
//     defer lookup.deinit();
    
//     const goku = User { .power = 9001 };
    
//     // goku -> &goku
//     try lookup.put("Goku", &goku);
    
//     // getPtr -> get
//     const entry = lookup.get("Goku").?;
//     std.debug.print("Goku's power is {d}\n", .{entry.power});
    
//     _ = lookup.remove("Goku");
//     std.debug.print("Goku's power is {d}\n", .{entry.power});
// }
// 
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    
    var lookup = std.StringHashMap(User).init(allocator);
    defer lookup.deinit();
    
    var buf: [30]u8 = undefined;
    var stdin = std.fs.File.stdin().reader(&buf);
    
    var stdout = std.fs.File.stdout().writer(&.{});
    
    var i: i32 = 0;
    while(true) : (i += 1) {
        try stdout.interface.print("Please enter a name:", .{});
        const name = try stdin.interface.takeDelimiterExclusive('\n');
        stdin.interface.toss(1); // discard the delimiter
        
        if(name.len == 0) {
            break;
        }
        try lookup.put(name, .{ .power = i });
    }

    const has_leto = lookup.contains("Leto");
    std.debug.print("{any}\n", .{has_leto});
}