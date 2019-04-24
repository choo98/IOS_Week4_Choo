//
//  ViewControllerTest.swift
//  Assignment_4_ChooTests
//
//  Created by ITS  Unit on 24/04/2019.
//  Copyright © 2019 ITS  Unit. All rights reserved.
//

import XCTest
@testable import Assignment_4_Choo

class ViewControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLat() {
        let vc = ViewController()
        
        let testLat:Double = 153.42096322
        
        XCTAssertTrue(vc.checkLatValid(dummyLat: testLat))
    }
}
