//
//  vector2.swift
//  Swift.Geometry
//
//  Created by Michael Kyriacou on 01/04/2016.
//
//

/**
 A structure holding positions in two dimensional space.
 */
struct Vector2
{
    /**
     * Represents the coordinate along the x axis
     */
    private var _x: Float!
    
    /**
     * Represents the coordinate along the y axis
     */
    private var _y: Float!
    
    var X: Float {
        get { return _x}
        set { _x = newValue }
    }
    
    var Y: Float {
        get { return _y}
        set { _y = newValue }
    }
    
    /**
     Initialise a Vector2 instance `x` and `y` coordinates.
     
     - Parameter x: Initial value for x axis.
     - Parameter y: Initial value for y axis.
     */
    init(x: Float, y: Float)
    {
        _x = x;
        _y = y;
    }
    
    /**
     Initialise a Vector2 instance with identical coordinates.
     
     - Parameter f: Initial value for each coordinate.
     */
    init(f: Float)
    {
        _x = f;
        _y = f;
    }
    
    /**
     Initialise a Vector2 instance with 0 value coordinates.
     
     - Returns: A zero initialised Vector2. Alias for Vector2(x: 0, y: 0).
     */
    static func Zero() -> Vector2
    {
        return Vector2(x: 0, y: 0)
    }
    
    /**
     Initialise a Vector2 instance with 1 valued coordinates.
     
     - Returns: A Vector2 initialised with 1 valued coordinates. Alias for Vector2(x: 1, y: 1).
     */
    static func One() -> Vector2
    {
        return Vector2(x: 1, y: 1)
    }
    
    /**
     Method for linear interpolation between two coordinates.<br/>
     Based on the linear interpolation formula: value1 + (value2 - value1) * amount.
     
     - Parameter v1: Starting position.
     - Parameter v2: Target position.
     - Parameter amount: Lerp amount.
     
     - Returns: A new Vector3 representing a position on a path between vectors v1 and v2.
     */
    mutating func Lerp(v1: Vector2, v2: Vector2, amount: Float)
    {
        let v3 = v1 + (v2 - v1) * amount;
        _x = v3.X;
        _y = v3.Y;
    }
    
    /**
     Return the magnitude or 'length' of a Vector2 instance.
     
     - Returns: The magintude of the Vector as a floating point number.
     */
    func magnitude() -> Float
    {
        return Math.sqrtf((_x*_x) + (_y*_y))
    }
}

/**
 Apply addition between two Vector2 instances.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 
 - Returns: A new Vector2 instance encompassing the result of `v1` + `v2`.
 */
func + (v1: Vector2, v2: Vector2) -> Vector2
{
    return Vector2(x: v1.X + v2.X, y: v1.Y + v2.Y)
}

/**
 Apply addition between a Vector2 instance and floating point number.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to add to Vectors (Float).
 
 - Returns: A new Vector2 instance encompassing the result of `v1` + `f`.
 */
func + (v1: Vector2, f: Float) -> Vector2
{
    return Vector2(x: v1.X + f, y: v1.Y + f)
}

/**
 Apply subtraction between two Vector2 instances.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 
 - Returns: A new Vector2 instance encompassing the result of `v1` - `v2`.
 */
func - (v1: Vector2, v2: Vector2) -> Vector2
{
    return Vector2(x: v1.X - v2.X, y: v1.Y - v2.Y)
}

/**
 Apply subtraction between a Vector2 instance and floating point number.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to subtract from Vectors (Float).
 
 - Returns: A new Vector2 instance encompassing the result of `v1` - `f`.
 */
func - (v1: Vector2, f: Float) -> Vector2
{
    return Vector2(x: v1.X - f, y: v1.Y - f)
}

/**
 Apply multiplication between two Vector2 instances.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 
 - Returns: A new Vector2 instance encompassing the result of `v1` x `v2`.
 */
func * (v1: Vector2, v2: Vector2) -> Vector2
{
    return Vector2(x: v1.X * v2.X, y: v1.Y * v2.Y)
}

/**
 Apply multiplication between a Vector2 instance and floating point number.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to multiply Vectors by (Float).
 
 - Returns: A new Vector2 instance encompassing the result of `v1` x `f`.
 */
func * (v1: Vector2, f: Float) -> Vector2
{
    return Vector2(x: v1.X * f, y: v1.Y * f)
}

/**
 Apply division between two Vector2 instances.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 
 - Returns: A new Vector2 instance encompassing the result of `v1` ÷ `v2`.
 */
func / (v1: Vector2, v2: Vector2) -> Vector2
{
    return Vector2(x: v1.X / v2.X, y: v1.Y / v2.Y)
}

/**
 Apply devision between a Vector2 instance and floating point number.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to divide Vectors by (Float).
 
 - Returns: A new Vector2 instance encompassing the result of `v1` ÷ `f`.
 */
func / (v1: Vector2, f: Float) -> Vector2
{
    return Vector2(x: v1.X / f, y: v1.Y / f)
}

/**
 Test equality between two Vector2 instances.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 
 - Returns: A boolean instance representing the equality of `v1` and `v2`
 */
func == (v1: Vector2, v2: Vector2) -> Bool
{
    return (v1.X == v2.X) && (v1.Y == v2.Y)
}

/**
 Test inequality between two Vector2 instances.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 
 - Returns: A boolean instance representing the inequality of `v1` and `v2`
 */
func != (v1: Vector2, v2: Vector2) -> Bool
{
    return (v1.X != v2.X) || (v1.Y != v2.Y)
}

/**
 Adds the value of v2 to v1.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 */
func += (inout v1: Vector2, v2: Vector2)
{
    v1 = v1 + v2;
}

/**
 Adds the value of f to v1.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to add to v1.
 */
func += (inout v1: Vector2, f: Float)
{
    v1 = v1 + f;
}

/**
 subtract the value of v2 from v1.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 */
func -= (inout v1: Vector2, v2: Vector2)
{
    v1 = v1 - v2;
}

/**
 subtract the value of f from v1.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to subtract from v1.
 */
func -= (inout v1: Vector2, f: Float)
{
    v1 = v1 - f;
}

/**
 Multiplies the value of v1 by v2.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 */
func *= (inout v1: Vector2, v2: Vector2)
{
    v1 = v1 * v2;
}

/**
 Multiplies the value of v1 by f.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to multiply v1 by.
 */
func *= (inout v1: Vector2, f: Float)
{
    v1 = v1 * f;
}

/**
 Divides the value of v1 by v2.
 
 - Parameter v1: First Vector2 operand.
 - Parameter v2: Second Vector2 operand.
 */
func /= (inout v1: Vector2, v2: Vector2)
{
    v1 = v1 / v2;
}

/**
 Divides the value of v1 by f.
 
 - Parameter v1: First Vector2 operand.
 - Parameter f:  Amount to divide v1 by.
 */
func /= (inout v1: Vector2, f: Float)
{
    v1 = v1 / f;
}





