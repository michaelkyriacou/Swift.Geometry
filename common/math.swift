//
//  math.swift
//  Swift.Geometry
//
//  Created by Michael Kyriacou on 04/04/2016.
//
//

class Math
{
    /**
     Method for return the square root or inverse square root of a float.
     Based on the [Fast Inverse Square Root](https://en.wikipedia.org/wiki/Fast_inverse_square_root) algorithm
     
     - Parameter f: Float value to retrieve square root of.
     - Parameter inverse: Return the inverse square root?
     - Parameter iterations: More iterations results in greater accurancy. 4 iterations
     results in accuracy upto 6 decimal places (on par with Swift's implimentation).
     
     - Returns: The square root of `f` accurate to 6 decimal places..
     */
    static func sqrtf(f: Float, inverse: Bool = false, iterations: Int8 = 4) -> Float {
        let i = 0x5f3759df - (f._toBitPattern() >> 1);
        var a = Float._fromBitPattern(i);
        for _ in 0...iterations-1 { a = a * (1.5 - ((f/2) * (a * a))) }
        if inverse { return a; }
        return a*f
    }
}
