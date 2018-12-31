//
//  ExpressibleByAmount.swift
//  Zesame
//
//  Created by Alexander Cyon on 2018-12-14.
//  Copyright © 2018 Open Zesame. All rights reserved.
//

import Foundation
import BigInt

/// A type representing an Zilliqa amount in any denominator, specified by the `Unit` and the value measured
/// in said unit by the `Magnitude`. For convenience any type can be converted to the default units, such as
/// Zil, Li, and Qa. Any type can also be initialized from said units. For convenience we can perform arthimetic
// between two instances of the same type but we can also perform artithmetic between two different types, e.g.
// Zil(2) + Li(3_000_000) // 5 Zil
/// We can also compare them of course. An extension on The Magnitude allows for syntax like 3.zil
/// analogously for Li and Qa.
public protocol ExpressibleByAmount: UnitSpecifying,
Codable,
Comparable,
CustomStringConvertible,
CustomDebugStringConvertible,
ExpressibleByIntegerLiteral,
ExpressibleByFloatLiteral,
ExpressibleByStringLiteral
where Magnitude == BigInt {

    associatedtype Magnitude

    // These are the two most important properties of the `ExpressibleByAmount` protocol,
    // the unit in which the value - the magnitude is measured.
    static var unit: Unit { get }
    var magnitude: Magnitude { get }

    // "Designated" initializer
    init(_ value: Magnitude, in unit: Unit)

    // Convenience translations
    var inLi: Li { get }
    var inZil: Zil { get }
    var inQa: Qa { get }

    static func validate(magnitude: Magnitude) throws -> Magnitude
    static func validate(magnitude: String) throws -> Magnitude
    
    // Convenience initializers
    init(magnitude: String) throws
    init(zil zilString: String) throws
    init(li liString: String) throws
    init(qa qaString: String) throws
}

extension ExpressibleByAmount {
    init<UE>(amount unbound: UE) where UE: Unbound & ExpressibleByAmount {
//        self.init(valid: unbound.valueMeasured(in: Self.unit))
        self.init(unbound.magnitude, in: unbound.unit)
    }

}
