const std = @import("std");
pub const prime = @import("prime/prime.zig");

const alloc = std.heap.page_allocator;

pub fn main() !void {
    std.debug.print("p(3)={}\n", .{prime.isPrime(3)});

    const args = try std.process.argsAlloc(alloc);
    defer std.process.argsFree(alloc, args);

    var max: u64 = 0;
    if (args.len == 1) {
        std.debug.print("Expected a max prime.\n", .{});
        // For local development with IntelliJ.
        // max = 100;
        std.process.exit(1);
    } else {
        max = try std.fmt.parseInt(u64, args[1], 10);
    }

    var primes = std.ArrayList(u64).init(alloc);
    defer primes.deinit();

    var i: u64 = 3;
    while (i < max) {
        const isP = prime.isPrime(i);
        if (isP) {
            try primes.append(i);
        }
        i += 2;
    }

    try std.json.stringify(
        primes.items,
        std.json.StringifyOptions{ .whitespace = .indent_2 },
        std.io.getStdOut().writer(),
    );

    // var file = try std.fs.cwd().createFile("primes.txt", .{});
    // defer file.close();
    // try file.writer().print("2\n", .{});
    // for (primes.items) |p| {
    //     try file.writer().print("{}\n", .{p});
    // }
}


test {
    std.testing.refAllDecls(@This());
}