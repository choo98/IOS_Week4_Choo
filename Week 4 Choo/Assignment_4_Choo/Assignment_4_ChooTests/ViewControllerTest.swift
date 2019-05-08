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
    
    //testing for latitude and it should fail because latitude is less than -90 degrees//
    func testLat() {
        let vc = ViewController()
        
        let fakeNum : String? = "-107.99642604;153.42767357"
        
        let fakeCoordinate = fakeNum?.components(separatedBy: ";")
        let fakeLat: String? = fakeCoordinate![0]
        let fakeLong: String? = fakeCoordinate![1]
        
        XCTAssertFalse(vc.checkLatValid(dummyLat: fakeLat!, dummyLong: fakeLong!, dummyNum: fakeLat!))
    }
    
    //testing for longtitude and it should fail because longitude is more than 180 degrees//
    func testLong() {
        let vc = ViewController()
        
        let fakeNum : String? = "-57.99642604;300.42767357"
        
        let fakeCoordinate = fakeNum?.components(separatedBy: ";")
        let fakeLat: String? = fakeCoordinate![0]
        let fakeLong: String? = fakeCoordinate![1]
        
        XCTAssertFalse(vc.checkLatValid(dummyLat: fakeLat!, dummyLong: fakeLong!, dummyNum: fakeLat!))
    }
    
    //testing for coordinates and it should fail because latitude is not a valid latitude
    func testCoord() {
        let vc = ViewController()
        
        let fakeNum : String? = ";;;-57.99642604;120.42767357"
        
        let fakeCoordinate = fakeNum?.components(separatedBy: ";")
        let fakeLat: String? = fakeCoordinate![0]
        let fakeLong: String? = fakeCoordinate![1]
        
        XCTAssertFalse(vc.checkLatValid(dummyLat: fakeLat!, dummyLong: fakeLong!, dummyNum: fakeLat!))
    }
    
    //testing for empty coordinates should fail because coordinates are empty
    func testEmpty() {
        let vc = ViewController()
        
        let fakeNum : String? = ""
        
        //let fakeCoordinate = fakeNum?.components(separatedBy: ";")
        // had to remove this line and insert empty strings manually because there is only one index in fakeNum
        let fakeLat: String? = ""
        let fakeLong: String? = ""
        
        XCTAssertFalse(vc.checkLatValid(dummyLat: fakeLat!, dummyLong: fakeLong!, dummyNum: fakeLat!))
    }
    
    //testing for valid coordinates with num only and this should fail because there is non-numeral are in the coordinates
    func testValidCoord() {
        let vc = ViewController()
        
        let fakeNum : String? = "aaaaadsasd-57.99642604;cxasdasdaczx300.42767357"
        
        let fakeCoordinate = fakeNum?.components(separatedBy: ";")
        let fakeLat: String? = fakeCoordinate![0]
        let fakeLong: String? = fakeCoordinate![1]
        
        XCTAssertFalse(vc.checkLatValid(dummyLat: fakeLat!, dummyLong: fakeLong!, dummyNum: fakeLat!))
    }

}
