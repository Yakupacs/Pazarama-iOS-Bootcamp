//
//  UnitTestsTests.swift
//  UnitTestsTests
//
//  Created by Yakup on 28.10.2023.
//

import XCTest
@testable import UnitTests

final class UnitTestsTests: XCTestCase {

	let mathFunctions = MathFunctions()
	
	func testAddition() throws {
		let result = mathFunctions.addition(3, 5) // 8
		XCTAssertEqual(result, 8)
	}
	func testSubtraction() throws {
	}
	func testMultiplication() throws {
	}
	func testDivision() throws {
	}

}
