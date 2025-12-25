const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    
    const calc_module = b.addModule("calc", .{
        .root_source_file = b.path("calc/calc.zig"),
    });

    const mod = b.createModule(.{
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("learning.zig"),
        .imports = &.{
            .{.name = "calc", .module = calc_module },
        }
    });
    {
        // setup exe
        const exe = b.addExecutable(.{
            .name = "learning",
            .root_module = mod,
        });
        //b.installArtifact(exe);
        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());

        const run_step = b.step("run", "Start Learning...");
        run_step.dependOn(&run_cmd.step);
    }
    {
        // setup tests
        const tests = b.addTest(.{
            .root_module = mod,
        });
        const test_cmd = b.addRunArtifact(tests);
        test_cmd.step.dependOn(b.getInstallStep());
        
        const test_step = b.step("test", "Run tests...");
        test_step.dependOn(&test_cmd.step);
    }
}
