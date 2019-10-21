//
//  DatabaseTest.swift
//  ParkMyVehicleTests
//
//  Created by Abhijeet Upadhyay on 14/06/19.
//  Copyright © 2019 Kaha Pte Ltd. All rights reserved.
//

import XCTest
@testable import ParkMyVehicle

class DatabaseTest: XCTestCase {
    
    var sutVehicle:Vehicle!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sutVehicle = Vehicle(vehicleNumber: 101, parkingLotNumber: 1001)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_vehicleIsParkedi_DB() {
        ParkingData.parkVehicle(sutVehicle)
        let parkedVehicle = ParkingData.getParkedVehicle(withNumber: 101)
        XCTAssertEqual(parkedVehicle?.vehicleId , 101)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
