const std = @import("std");

pub fn main() void {
    const stdin = std.io.getStdIn();
    std.debug.print("{}\n", .{stdin});
}
