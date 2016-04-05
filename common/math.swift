//
//  math.swift
//  Swift.Geometry
//
//  Created by Michael Kyriacou on 04/04/2016.
//
//

class Math
{
    // See https://en.wikipedia.org/wiki/Fast_inverse_square_root
    static func sqrtf(f: Float, inverse: Bool = false, iterations: Int8 = 4) -> Float {
        let i = 0x5f3759df - (f._toBitPattern() >> 1);
        var a = Float._fromBitPattern(i);
        for _ in 0...iterations-1 { a = a * (1.5 - ((f/2) * (a * a))) }
        if inverse { return a; }
        return a*f
    }
}
