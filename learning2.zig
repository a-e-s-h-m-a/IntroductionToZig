const std = @import("std");

pub fn main() void {
    // const n = Number { .int = 32 };
    // std.debug.print("{d}\n", .{n.int});
    
    const ts = Timestamp{.unix = 1693278411};
    std.debug.print("{d}\n", .{ts.seconds()});
    
    //main2();
}

const Number = union {
    int: i64,
    float: f64,
    nan: void
};

const TimestampType = enum { 
    unix,
    datetime
};

const Timestamp = union(TimestampType) {
    unix: i32,
    datetime: DateTime,
    
    const DateTime = struct {
        year: u16,
        month: u8,
        day: u8,
        hour: u8,
        minute: u8,
        second: u8,
    };
    
    fn seconds(self: Timestamp) u16 {
        switch (self) {
            .datetime => |dt| return dt.second,
            .unix => |ts| {
                const seconds_since_midnight: i32 = @rem(ts, 86400);
                return @intCast(@rem(seconds_since_midnight, 60));
            }
        }
    }
};

// -------------

pub fn main2() !void {
    return error.AccessDenied;
}

const OpenError = error {
    AccessDenied,
    NotFound
};

