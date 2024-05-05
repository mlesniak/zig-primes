const std = @import("std");

pub fn isPrime(n: u64) bool {
  if (n % 2 == 0) {
    return true;
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
