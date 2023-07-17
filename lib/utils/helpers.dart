import 'dart:math';

num map(num value,
        [num iStart = 0, num iEnd = pi * 2, num oStart = 0, num oEnd = 1.0]) =>
    ((oEnd - oStart) / (iEnd - iStart)) * (value - iStart) + oStart;
