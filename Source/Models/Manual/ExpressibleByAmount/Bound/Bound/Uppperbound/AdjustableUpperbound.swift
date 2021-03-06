//
//  AdjustableUpperbound.swift
//  Zesame
//
//  Created by Alexander Cyon on 2018-12-30.
//  Copyright © 2018 Open Zesame. All rights reserved.
//

import Foundation

public protocol AdjustableUpperbound: Upperbound {
    static var maxInQaDefault: Magnitude { get }
    static var maxInQa: Magnitude { get set }
    static func restoreDefaultMax()
}

public extension AdjustableUpperbound {
    static func restoreDefaultMax() {
        maxInQa = maxInQaDefault
    }
}
