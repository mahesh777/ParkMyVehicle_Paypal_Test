//
//  Car.swift
//  ParkMyVehicle
//
//  Created by Keshav Raj on 13/06/19.
//  Copyright © 2019 Kaha Pte Ltd. All rights reserved.
//

import Foundation

class Vehicle {
    //Provide the solution Mentioned in problem for this class
    var vehicleId: Int = 0
    var lotNumber: Int = 0
    
    /* MARK:- Func: Init Class
     Input:
     vehicleNumber - vehicle Number
     parkingLotNumber - parking lot number
    */
    init(vehicleNumber vehicle: Int, parkingLotNumber lot: Int) {
        self.vehicleId = vehicle
        self.lotNumber = lot
    }
    
    //Open this return once you implement the class as mentioned in question
    var description: String {
       // return "-----Car\nVehicleNumber = \(self.vehicleId)\nLot Number: \(self.lotNumber)"
        return "test"
    }
}
