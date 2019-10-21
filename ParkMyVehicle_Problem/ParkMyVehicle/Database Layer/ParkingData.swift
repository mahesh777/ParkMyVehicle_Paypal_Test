//
//  ParkingData.swift
//  ParkMyVehicle
//
//  Created by Abhijeet Upadhyay on 13/06/19.
//  Copyright © 2019 Abhijeet Upadhyay All rights reserved.

import Foundation
import RealmSwift

class ParkingData: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic private var vehicleNumber: Int = 0
    @objc dynamic private var lotNumber: Int = 0
   
    private convenience init(vehicleNumber: Int, lotNumber: Int) {
        self.init()
        self.vehicleNumber = vehicleNumber
        self.lotNumber = lotNumber
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// MARK:- Helper Methods
extension ParkingData {
    
    static func parkVehicle(_ vehicle: Vehicle) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(ParkingData(vehicleNumber: vehicle.vehicleId, lotNumber: vehicle.lotNumber))
        }
    }
    
    static func allParkedVehicle() -> [Vehicle] {
        let realm = try! Realm()
        return realm.objects(ParkingData.self).map { Vehicle(vehicleNumber: $0.vehicleNumber, parkingLotNumber: $0.lotNumber) }
    }
    
    static func getParkedVehicle(withNumber vehicleId: Int,
                                 lotNumber lot: Int) -> Vehicle? {
        let realm = try! Realm()
        let query = NSCompoundPredicate(type: .and,
                                        subpredicates: [NSPredicate(format: "lotNumber=%d", lot), NSPredicate(format: "vehicleNumber=%d", vehicleId)])
        
        guard let data = realm.objects(ParkingData.self).filter(query).first else {
            return nil
        }
        return Vehicle(vehicleNumber: data.vehicleNumber, parkingLotNumber: data.lotNumber)
    }
    
    static func isVehiclePresent(withNumber vehicleId: Int) -> Vehicle? {
        let realm = try! Realm()
        guard let data = realm.objects(ParkingData.self).filter(NSPredicate(format: "vehicleNumber=%d", vehicleId)).first else {
            return nil
        }
        return Vehicle(vehicleNumber: data.vehicleNumber, parkingLotNumber: data.lotNumber)
    }
    
    static func isParkingLotExist(lotNumber lot: Int) -> Vehicle? {
        let realm = try! Realm()
        guard let data = realm.objects(ParkingData.self).filter(NSPredicate(format: "lotNumber=%d", lot)).first else {
            return nil
        }
        return Vehicle(vehicleNumber: data.vehicleNumber, parkingLotNumber: data.lotNumber)
    }
    
    static func allBookedLots() -> [Int] {
         let realm = try! Realm()
        return realm.objects(ParkingData.self).map { $0.lotNumber }
    }
}
