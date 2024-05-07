const std = @import("std");

pub fn isPrime(n: u64) bool {
    if (n == 2) {
        return true;
    }
    if (n % 2 == 0) {
        return false;
    }

    var x: u64 = 3;
    const max = std.math.sqrt(n);
    while (x <= max) {
        if (n % x == 0) {
            return false;
        }
        x += 2;
    }

    return true;
}

test "isPrime" {
    try std.testing.expect(isPrime(2));
    try std.testing.expect(isPrime(3));
    try std.testing.expect(isPrime(11));
}

test "isNotPrime" {
    try std.testing.expect(!isPrime(4));
    try std.testing.expect(!isPrime(9));
    try std.testing.expect(!isPrime(15));
}
