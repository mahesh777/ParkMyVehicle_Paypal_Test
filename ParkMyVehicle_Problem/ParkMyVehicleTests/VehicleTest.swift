//
//  VehicleTest.swift
//  ParkMyVehicleTests
//
//  Created by Abhijeet Upadhyay on 13/06/19.
//  Copyright © 2019 Kaha Pte Ltd. All rights reserved.
//

//Public Test Case
import XCTest
@testable import ParkMyVehicle

class VehicleTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       
    }

    func test_CreateVehicleObject() {
        let sut = Vehicle(vehicleNumber: 100, parkingLotNumber: 10)
        XCTAssertNotNil(sut)
    }
    
    func test_CheckValidVehicleId() {
        let vehicleNumber = Int(100)
        // when
        let sut = Vehicle(vehicleNumber: vehicleNumber, parkingLotNumber: 10)
        // then
        XCTAssertEqual(sut.vehicleId, vehicleNumber)
    }
    
    func test_CheckValidityOfVehicleIdObject() {
        let vehicleNumber = Int(100)
        // when
        let sut = Vehicle(vehicleNumber: vehicleNumber, parkingLotNumber: 10)
        // then
        XCTAssertTrue(((sut as Any ) is Vehicle) && ((sut.vehicleId as Any) is Int), "Valied Vehicle Number")
    }
    
    func test_CheckValidVehicleLot() {
        let parkingLotNumber = Int(10)
        // when
        let sut = Vehicle(vehicleNumber: 100, parkingLotNumber: parkingLotNumber)
        // then
        XCTAssertEqual(sut.lotNumber, parkingLotNumber)
    }
    
    func test_CheckValidityOfVehicleLotObject() {
        let parkingLotNumber = Int(10)
        // when
        let sut = Vehicle(vehicleNumber: 100, parkingLotNumber: parkingLotNumber)
        // then
        XCTAssertTrue(((sut as Any ) is Vehicle) && ((sut.lotNumber as Any) is Int), "Valied Lot Number")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
