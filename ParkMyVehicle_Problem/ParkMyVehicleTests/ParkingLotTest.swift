//
//  ParkingLotTest.swift
//  ParkMyVehicleTests
//
//  Created by Abhijeet Upadhyay on 13/06/19.
//  Copyright © 2019 Kaha Pte Ltd. All rights reserved.
//

import XCTest
@testable import ParkMyVehicle

class ParkingLotTest: XCTestCase {
    var sutVehicle:Vehicle!
    var sutPLot:ParkingLot!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sutVehicle = Vehicle(vehicleNumber: 100, parkingLotNumber: 1000)
        sutPLot = ParkingLot()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_CheckParkedVehicleObject() {
        let sut = ParkingLot()
         XCTAssertNotNil(sut)
    }

    func testToCheckWeCanParkVehicleOrNot() {
        sutPLot.parkVehicle(sutVehicle) { (str) in
            if str == "Vehicle parked Successfully" {
                XCTAssertTrue(true, "Vehicle parked Successfully")
            } else if str == "Lot already taken"{
                XCTAssertFalse(true, "Lot already taken")
            } else {
                XCTAssertFalse(true, "Failed to park vehicle")
            }
        }
    }
}
