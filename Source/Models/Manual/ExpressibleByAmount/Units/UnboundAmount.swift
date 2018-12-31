//
//  UnboundAmount.swift
//  Zesame
//
//  Created by Alexander Cyon on 2018-12-30.
//  Copyright © 2018 Open Zesame. All rights reserved.
//

import Foundation
import BigInt

public func convert<Value>(_ value: Value, from: Unit, to: Unit) -> Value where Value: Comparable & Numeric & BinaryInteger {
    let nominator = Double(value)
    let base: Double = 10
    let exponent = Double(to.exponent - from.exponent)
    let denominator: Double = pow(base, exponent)
    let converted = nominator / denominator
    return Value(converted)
}

public struct UnboundAmount<UnitSpecifyingType: UnitSpecifying>: ExpressibleByAmount, Unbound {

    public typealias Magnitude = BigInt
    public static var unit: Unit {
        return UnitSpecifyingType.unit
    }
    public let magnitude: Magnitude

    public init(_ value: Magnitude, in unit: Unit) {
        self.magnitude = convert(value, from: unit, to: self.unit)
    }

//    public init(valid magnitude: Magnitude) {
//        self.magnitude = magnitude
//    }
//
//    public init(_ magnitude: Magnitude) {
//        self.init(valid: magnitude)
//    }

}
