//
//  vector3.swift
//  Swift.Geometry
//
//  Created by Michael Kyriacou on 09/04/2016.
//
//

/**
 A structure holding positions in three dimensional space.
 Coordinates are only to be set at initialisation and
 using the methods provided.
 */
struct Vector3
{
    /**
     * Represents the coordinate along the x axis
     */
    private var _x: Float
    
    /**
     * Represents the coordinate along the y axis
     */
    private var _y: Float
    
    /**
     * Represents the coordinate along the z axis
     */
    private var _z: Float
    
    /**
     * Read-only coordinate on the X axis.
     */
    var X: Float { return _x }
    
    /**
     * Read-only coordinate on the Y axis.
     */
    var Y: Float { return _y }
    
    /**
     * Read-only coordinate on the Z axis.
     */
    var Z: Float { return _z }
    
    /**
     Initialise a Vector3 instance `x`, `y` and `z` coordinates.
     
     - Parameter x: Initial value for x axis.
     - Parameter y: Initial value for y axis.
     - Parameter z: Initial value for z axis.
     */
    init(x: Float, y: Float , z: Float)
    {
        _x = x;
        _y = y;
        _z = z;
    }
    
    /**
     Initialise a Vector3 instance with identical coordinates.
     
     - Parameter f: Initial value for each coordinate.
     */
    init(f: Float)
    {
        _x = f;
        _y = f;
        _z = f;
    }
    
    /**
     Initialise a Vector3 instance with 0 value coordinates.
     
     - Returns: A zero initialised Vector3. Alias for Vector3(x: 0, y: 0, z:0).
     */
    static func Zero() -> Vector3
    {
        return Vector3(x: 0, y: 0, z: 0)
    }
    
    /**
     Initialise a Vector3 instance with 1 valued coordinates.
     
     - Returns: A Vector3 initialised with 1 valued coordinates. Alias for Vector3(x: 1, y: 1, z: 1).
     */
    static func One() -> Vector3
    {
        return Vector3(x: 1, y: 1, z: 1)
    }
    
    /**
     Returns an upward facing Vector3.
     
     Shortcut for Vector3(0.0, 1.0)
     
     - Returns: An upward facing Vector3 instance.
     */
    static func Up() -> Vector3
    {
        return Vector3(x: 0.0, y: 1.0, z: 0.0)
    }
    
    /**
     Returns a downward facing Vector3.
     
     Shortcut for Vector3(0.0, -1.0)
     
     - Returns: A downward facing Vector3 instance.
     */
    static func Down() -> Vector3
    {
        return Vector3(x: 0.0, y: -1.0, z: 0.0)
    }
    
    /**
     Returns a forward facing Vector3.
     
     Shortcut for Vector3(0.0, 0.0, 1.0)
     
     - Returns: A forward facing Vector3 instance.
     */
    static func Forward() -> Vector3
    {
        return Vector3(x: 0.0, y: 0.0, z: 1.0)
    }
    
    /**
     Returns a backward facing Vector3.
     
     Shortcut for Vector3(0.0, 0.0, -1.0)
     
     - Returns: A Backward facing Vector3 instance.
     */
    static func Backward() -> Vector3
    {
        return Vector3(x: 0.0, y: 0.0, z: -1.0)
    }
    
    /**
     Returns a left facing Vector3.
     
     Shortcut for Vector3(-1.0, 0.0)
     
     - Returns: A left facing Vector3 instance.
     */
    static func Left() -> Vector3
    {
        return Vector3(x: -1.0, y: 0.0, z: 0.0)
    }
    
    /**
     Returns a right facing Vector3.
     
     Shortcut for Vector3(1.0, 0.0)
     
     - Returns: A right facing Vector3 instance.
     */
    static func Right() -> Vector3
    {
        return Vector3(x: 1.0, y: 0.0, z: 0.0)
    }
    
    /**
     Method for linear interpolation between two coordinates.<br/>
     Based on the linear interpolation formula: value1 + (value2 - value1) * amount.
     
     - Parameter v1: Starting position.
     - Parameter v2: Target position.
     - Parameter amount: Lerp amount.
     
     - Returns: A new Vector3 representing a position on a path between vectors v1 and v2.
     */
    mutating func Lerp(v1: Vector3, v2: Vector3, amount: Float)
    {
        let v3 = v1 + (v2 - v1) * amount;
        _x = v3.X;
        _y = v3.Y;
        _z = v3.Z;
    }
    
    /**
     Return the magnitude or 'length' of a Vector3 instance.
     
     - Returns: The magintude of the Vector as a floating point number.
     */
    func magnitude() -> Float
    {
        return Math.sqrtf((_x*_x) + (_y*_y) + (_z*_z))
    }
    
    /**
     Returns the dot product of two Vector3 coordinates.
     
     - Parameter v1: First Vector3 operand.
     - Parameter v2: Second Vector3 operand.
     
     - Returns: The representation of the dot product between v1 and v2.
     */
    static func Dot(v1: Vector3, v2: Vector3) -> Float
    {
        return (v1.X * v2.X) + (v1.Y * v2.Y) + (v1.Z * v2.Z);
    }
    
    /**
     Return the distance between two Vector3 instances.
     
     - Parameter v1: Starting position.
     - Parameter v2: Target position.
     
     - Returns: The distance between two Vector3 instances.
     */
    static func Distance(v1: Vector3, v2: Vector3) -> Float
    {
        return Math.sqrtf(Vector3.Dot((v1-v2), v2: (v1-v2)))
    }
    
    /**
     Return the distance between the current Vector3 instance and another instance.
     
     - Parameter other: The remote Vector3 instance.
     
     - Returns: The distance between the current Vector3 instance and another instance.
     */
    func distance(other: Vector3) -> Float
    {
        return Math.sqrtf(Vector3.Dot((self-other), v2: (self-other)))
    }
    
    /**
     Normalizes the current Vector3 instance, maintaining direction.
     
     - Returns: A normalized Vector3 instance with a magnitude of 1.0.
     */
    mutating func normalize()
    {
        let factor = 1.0 / magnitude()
        _x *= factor;
        _y *= factor;
        _z *= factor;
    }
}

/**
 Apply addition between two Vector3 instances.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 
 - Returns: A new Vector3 instance encompassing the result of `v1` + `v2`.
 */
func + (v1: Vector3, v2: Vector3) -> Vector3
{
    return Vector3(x: v1.X + v2.X, y: v1.Y + v2.Y, z: v1.Z + v2.Z)
}

/**
 Apply addition between a Vector3 instance and floating point number.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to add to Vectors (Float).
 
 - Returns: A new Vector3 instance encompassing the result of `v1` + `f`.
 */
func + (v1: Vector3, f: Float) -> Vector3
{
    return Vector3(x: v1.X + f, y: v1.Y + f, z: v1.Z + f)
}

/**
 Apply subtraction between two Vector3 instances.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 
 - Returns: A new Vector3 instance encompassing the result of `v1` - `v2`.
 */
func - (v1: Vector3, v2: Vector3) -> Vector3
{
    return Vector3(x: v1.X - v2.X, y: v1.Y - v2.Y, z: v1.Z - v2.Z)
}

/**
 Apply subtraction between a Vector3 instance and floating point number.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to subtract from Vectors (Float).
 
 - Returns: A new Vector3 instance encompassing the result of `v1` - `f`.
 */
func - (v1: Vector3, f: Float) -> Vector3
{
    return Vector3(x: v1.X - f, y: v1.Y - f, z: v1.Z - f)
}

/**
 Apply multiplication between two Vector3 instances.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 
 - Returns: A new Vector3 instance encompassing the result of `v1` x `v2`.
 */
func * (v1: Vector3, v2: Vector3) -> Vector3
{
    return Vector3(x: v1.X * v2.X, y: v1.Y * v2.Y, z: v1.Z * v2.Z)
}

/**
 Apply multiplication between a Vector3 instance and floating point number.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to multiply Vectors by (Float).
 
 - Returns: A new Vector3 instance encompassing the result of `v1` x `f`.
 */
func * (v1: Vector3, f: Float) -> Vector3
{
    return Vector3(x: v1.X * f, y: v1.Y * f, z: v1.Z * f)
}

/**
 Apply division between two Vector3 instances.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 
 - Returns: A new Vector3 instance encompassing the result of `v1` ÷ `v2`.
 */
func / (v1: Vector3, v2: Vector3) -> Vector3
{
    return Vector3(x: v1.X / v2.X, y: v1.Y / v2.Y, z: v1.Z / v2.Z)
}

/**
 Apply devision between a Vector3 instance and floating point number.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to divide Vectors by (Float).
 
 - Returns: A new Vector3 instance encompassing the result of `v1` ÷ `f`.
 */
func / (v1: Vector3, f: Float) -> Vector3
{
    return Vector3(x: v1.X / f, y: v1.Y / f, z: v1.Z / f)
}

/**
 Test equality between two Vector3 instances.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 
 - Returns: A boolean instance representing the equality of `v1` and `v2`
 */
func == (v1: Vector3, v2: Vector3) -> Bool
{
    return (v1.X == v2.X) && (v1.Y == v2.Y) && (v1.Z == v2.Z)
}

/**
 Test inequality between two Vector3 instances.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 
 - Returns: A boolean instance representing the inequality of `v1` and `v2`
 */
func != (v1: Vector3, v2: Vector3) -> Bool
{
    return (v1.X != v2.X) || (v1.Y != v2.Y) || (v1.Z != v2.Z)
}

/**
 Adds the value of v2 to v1.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 */
func += (inout v1: Vector3, v2: Vector3)
{
    v1 = v1 + v2;
}

/**
 Adds the value of f to v1.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to add to v1.
 */
func += (inout v1: Vector3, f: Float)
{
    v1 = v1 + f;
}

/**
 subtract the value of v2 from v1.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 */
func -= (inout v1: Vector3, v2: Vector3)
{
    v1 = v1 - v2;
}

/**
 subtract the value of f from v1.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to subtract from v1.
 */
func -= (inout v1: Vector3, f: Float)
{
    v1 = v1 - f;
}

/**
 Multiplies the value of v1 by v2.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 */
func *= (inout v1: Vector3, v2: Vector3)
{
    v1 = v1 * v2;
}

/**
 Multiplies the value of v1 by f.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to multiply v1 by.
 */
func *= (inout v1: Vector3, f: Float)
{
    v1 = v1 * f;
}

/**
 Divides the value of v1 by v2.
 
 - Parameter v1: First Vector3 operand.
 - Parameter v2: Second Vector3 operand.
 */
func /= (inout v1: Vector3, v2: Vector3)
{
    v1 = v1 / v2;
}

/**
 Divides the value of v1 by f.
 
 - Parameter v1: First Vector3 operand.
 - Parameter f:  Amount to divide v1 by.
 */
func /= (inout v1: Vector3, f: Float)
{
    v1 = v1 / f;
}
