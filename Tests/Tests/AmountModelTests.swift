//
//  AmountModelTests.swift
//  ZilliqaSDKTests
//
//  Created by Alexander Cyon on 2018-05-25.
//  Copyright © 2018 Open Zesame. All rights reserved.
//


import XCTest
@testable import ZilliqaSDK

class AmountModelTests: XCTestCase {

    func testCreatingValidAmountUsingDesignatedInitializer() {
        let amount = Amount(double: 1)
        XCTAssertTrue(amount?.amount == 1)
    }

    func testCreatingValidAmountUsingExpressibleByFloatLiteralInitializer() {
        let amount: Amount = 1.0
        XCTAssertTrue(amount.amount == 1)
    }

    func testCreatingValidAmountUsingExpressibleByIntegerLiteralInitializer() {
        let amount: Amount = 1
        XCTAssertTrue(amount.amount == 1)
    }
}