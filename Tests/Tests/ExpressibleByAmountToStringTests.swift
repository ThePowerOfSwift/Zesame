//
//  File.swift
//  Zesame
//
//  Created by Alexander Cyon on 2019-01-01.
//  Copyright © 2019 Open Zesame. All rights reserved.
//

import Foundation
import XCTest
import BigInt
@testable import Zesame

class ExpressibleByAmountToStringTests: XCTestCase {

    func testQa() {
        do {
            let big = try ZilAmount(qa: "20999999999123567912432")
            let small = try ZilAmount(qa: "510231481549")
            let expected = try ZilAmount(qa: "20999999999633799393981")
            let expectedPlus1 = try ZilAmount(qa: "20999999999633799393982")
            let expectedMinus1 = try ZilAmount(qa: "20999999999633799393980")
            XCTAssertEqual(try big + small, expected)
            XCTAssertLessThan(try big + small, expectedPlus1)
            XCTAssertGreaterThan(try big + small, expectedMinus1)
        } catch {
            return XCTFail()
        }
    }

    func test10LiInQaAsString() {
        XCTAssertEqual(Qa(10000000).asString(in: .li), "10")
    }

    func testQaAsString() {
        XCTAssertEqual(Qa(1).asString(in: .qa), "1")
        XCTAssertEqual(Qa(1).asString(in: .li), "0.000001")
        XCTAssertEqual(Qa(1).asString(in: .zil), "0.000000000001")

        XCTAssertEqual(Qa(10).asString(in: .qa), "10")
        XCTAssertEqual(Qa(10).asString(in: .li), "0.00001")

        XCTAssertEqual(Qa(100).asString(in: .qa), "100")
        XCTAssertEqual(Qa(100).asString(in: .li), "0.0001")
        XCTAssertEqual(Qa(100).asString(in: .zil), "0.0000000001")

        XCTAssertEqual(Qa(1000).asString(in: .qa), "1000")
        XCTAssertEqual(Qa(1000).asString(in: .li), "0.001")
        XCTAssertEqual(Qa(7000).asString(in: .zil), "0.000000007")

        XCTAssertEqual(Qa(10005).asString(in: .qa), "10005")
        XCTAssertEqual(Qa(10000).asString(in: .li), "0.01")
        XCTAssertEqual(Qa(50000).asString(in: .zil), "0.00000005")

        XCTAssertEqual(Qa(100008).asString(in: .qa), "100008")
        XCTAssertEqual(Qa(100000).asString(in: .li), "0.1")
        XCTAssertEqual(Qa(100000).asString(in: .zil), "0.0000001")

        XCTAssertEqual(Qa(1000001).asString(in: .qa), "1000001")
        XCTAssertEqual(Qa(1000000).asString(in: .li), "1")
        XCTAssertEqual(Qa(1000000).asString(in: .zil), "0.000001")

        XCTAssertEqual(Qa(10000004).asString(in: .qa), "10000004")
        XCTAssertEqual(Qa(10000000).asString(in: .li), "10")
        XCTAssertEqual(Qa(10000000).asString(in: .zil), "0.00001")

        XCTAssertEqual(Qa(100000003).asString(in: .qa), "100000003")
        XCTAssertEqual(Qa(100000000).asString(in: .li), "100")
        XCTAssertEqual(Qa(100000000).asString(in: .zil), "0.0001")

        XCTAssertEqual(Qa(1000000009).asString(in: .qa), "1000000009")
        XCTAssertEqual(Qa(1000000000).asString(in: .li), "1000")
        XCTAssertEqual(Qa(1000000000).asString(in: .zil), "0.001")

        XCTAssertEqual(Qa(10000000002).asString(in: .qa), "10000000002")
        XCTAssertEqual(Qa(10000000000).asString(in: .li), "10000")
        XCTAssertEqual(Qa(10000000000).asString(in: .zil), "0.01")

        XCTAssertEqual(Qa(700000005434).asString(in: .qa), "700000005434")
        XCTAssertEqual(Qa(674723000000).asString(in: .li), "674723")
        XCTAssertEqual(Qa(100000000000).asString(in: .zil), "0.1")

        XCTAssertEqual(Qa(1000000000003).asString(in: .qa), "1000000000003")
        XCTAssertEqual(Qa(1000000000000).asString(in: .li), "1000000")
        XCTAssertEqual(Qa(1000000000000).asString(in: .zil), "1")

        XCTAssertEqual(Qa(10000000000007).asString(in: .qa), "10000000000007")
        XCTAssertEqual(Qa(10000005000000).asString(in: .li), "10000005")
        XCTAssertEqual(Qa(17000000000000).asString(in: .zil), "17")
    }

    func testLiAsString() {
        XCTAssertEqual(Li(1).asString(in: .qa), "1000000")
        XCTAssertEqual(Li(1).asString(in: .li), "1")
        XCTAssertEqual(Li(1).asString(in: .zil), "0.000001")

        XCTAssertEqual(Li(10).asString(in: .qa), "10000000")
        XCTAssertEqual(Li(10).asString(in: .li), "10")
        XCTAssertEqual(Li(10).asString(in: .zil), "0.00001")

        XCTAssertEqual(Li(100).asString(in: .qa), "100000000")
        XCTAssertEqual(Li(100).asString(in: .li), "100")
        XCTAssertEqual(Li(100).asString(in: .zil), "0.0001")

        XCTAssertEqual(Li(1000).asString(in: .qa), "1000000000")
        XCTAssertEqual(Li(1000).asString(in: .li), "1000")
        XCTAssertEqual(Li(1000).asString(in: .zil), "0.001")

        XCTAssertEqual(Li(10000).asString(in: .qa), "10000000000")
        XCTAssertEqual(Li(10000).asString(in: .li), "10000")
        XCTAssertEqual(Li(10000).asString(in: .zil), "0.01")

        XCTAssertEqual(Li(100000).asString(in: .qa), "100000000000")
        XCTAssertEqual(Li(100000).asString(in: .li), "100000")
        XCTAssertEqual(Li(100000).asString(in: .zil), "0.1")

        XCTAssertEqual(Li(1000000).asString(in: .qa), "1000000000000")
        XCTAssertEqual(Li(1000000).asString(in: .li), "1000000")
        XCTAssertEqual(Li(1000000).asString(in: .zil), "1")

        XCTAssertEqual(Li(10000000).asString(in: .qa), "10000000000000")
        XCTAssertEqual(Li(10000000).asString(in: .li), "10000000")
        XCTAssertEqual(Li(10000000).asString(in: .zil), "10")

        XCTAssertEqual(Li(100000000).asString(in: .qa), "100000000000000")
        XCTAssertEqual(Li(100000000).asString(in: .li), "100000000")
        XCTAssertEqual(Li(987000000).asString(in: .zil), "987")

        XCTAssertEqual(Li(1000000000).asString(in: .qa), "1000000000000000")
        XCTAssertEqual(Li(1000000000).asString(in: .li), "1000000000")
        XCTAssertEqual(Li(4321000000).asString(in: .zil), "4321")

        XCTAssertEqual(Li(10000000000).asString(in: .qa), "10000000000000000")
        XCTAssertEqual(Li(10000000000).asString(in: .li), "10000000000")
        XCTAssertEqual(Li(10000000000).asString(in: .zil), "10000")

        XCTAssertEqual(Li(100000000000).asString(in: .qa), "100000000000000000")
        XCTAssertEqual(Li(100000000000).asString(in: .li), "100000000000")
        XCTAssertEqual(Li(106078000000).asString(in: .zil), "106078")

        XCTAssertEqual(Li(1000000000000).asString(in: .qa), "1000000000000000000")
        XCTAssertEqual(Li(1000000000000).asString(in: .li), "1000000000000")
        XCTAssertEqual(Li(1000000000000).asString(in: .zil), "1000000")

        XCTAssertEqual(Li(10000000000000).asString(in: .qa), "10000000000000000000")
        XCTAssertEqual(Li(10000000000000).asString(in: .li), "10000000000000")
        XCTAssertEqual(Li(10000000000000).asString(in: .zil), "10000000")
    }

    func testZilAsString() {
        XCTAssertEqual(Zil(1).asString(in: .qa), "1000000000000")
        XCTAssertEqual(Zil(1).asString(in: .li), "1000000")
        XCTAssertEqual(Zil(1).asString(in: .zil), "1")

        XCTAssertEqual(Zil(10).asString(in: .qa), "10000000000000")
        XCTAssertEqual(Zil(10).asString(in: .li), "10000000")
        XCTAssertEqual(Zil(10).asString(in: .zil), "10")

        XCTAssertEqual(Zil(100).asString(in: .qa), "100000000000000")
        XCTAssertEqual(Zil(100).asString(in: .li), "100000000")
        XCTAssertEqual(Zil(100).asString(in: .zil), "100")

        XCTAssertEqual(Zil(1000).asString(in: .qa), "1000000000000000")
        XCTAssertEqual(Zil(1000).asString(in: .li), "1000000000")
        XCTAssertEqual(Zil(1234).asString(in: .zil), "1234")

        XCTAssertEqual(Zil(10000).asString(in: .qa), "10000000000000000")
        XCTAssertEqual(Zil(10000).asString(in: .li), "10000000000")
        XCTAssertEqual(Zil(10000).asString(in: .zil), "10000")

        XCTAssertEqual(Zil(100000).asString(in: .qa), "100000000000000000")
        XCTAssertEqual(Zil(100000).asString(in: .li), "100000000000")
        XCTAssertEqual(Zil(12345).asString(in: .zil), "12345")

        XCTAssertEqual(Zil(1000000).asString(in: .qa), "1000000000000000000")
        XCTAssertEqual(Zil(1000000).asString(in: .li), "1000000000000")
        XCTAssertEqual(Zil(123456).asString(in: .zil), "123456")

        XCTAssertEqual(Zil(1234567).asString(in: .qa), "1234567000000000000")
        XCTAssertEqual(Zil(1234567).asString(in: .li), "1234567000000")
        XCTAssertEqual(Zil(1234567).asString(in: .zil), "1234567")

        XCTAssertEqual(Zil(100000000).asString(in: .qa), "100000000000000000000")
        XCTAssertEqual(Zil(100000000).asString(in: .li), "100000000000000")
        XCTAssertEqual(Zil(987000000).asString(in: .zil), "987000000")

        XCTAssertEqual(Zil(9000000000).asString(in: .qa), "9000000000000000000000")
        XCTAssertEqual(Zil(9000000000).asString(in: .li), "9000000000000000")
        XCTAssertEqual(Zil(9085000000).asString(in: .zil), "9085000000")

        // bigger than total supply
        XCTAssertEqual(Zil(39000000009).asString(in: .qa), "39000000009000000000000")
        XCTAssertEqual(Zil(39000000004).asString(in: .li), "39000000004000000")
        XCTAssertEqual(Zil(39085000499).asString(in: .zil), "39085000499")
    }

}
