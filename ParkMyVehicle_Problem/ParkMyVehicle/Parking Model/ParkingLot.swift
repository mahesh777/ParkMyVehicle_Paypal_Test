
//Provide the solution Mentioned in problem for this class

class ParkingLot {
    static let PARKING_TAKEN = "Lot already taken"
    static let VECHICLE_PRESENT = "Vehicle already present"
    static let PARKING_DONE = "Vehicle parked Successfully"
    
    /* MARK:- Func: parkVehicle
     Input:
     vehicle - vehicle Number and parking lot number
     completion - completion handler returns String result
     */
    public func parkVehicle(_ vehicle: Vehicle, completion: @escaping(String) -> ()) {
        if isVehicleExists(vehicle) {
            completion(ParkingLot.VECHICLE_PRESENT)
        } else if isLotBooked(vehicle.lotNumber) {
            completion(ParkingLot.PARKING_TAKEN)
        } else {
            if isVehicleAndParkingLotExists(vehicle) {
                completion(ParkingLot.VECHICLE_PRESENT)
            } else {
                parkVehicleOnPlace(vehicle)
                completion(ParkingLot.PARKING_DONE)
            }
        }
    }
    
    /* MARK:- Func: isLotBooked
     Input:
     lot - parking lot number
     Output:
     Return result if Parking lot is present or not
     */
    private func isLotBooked(_ lot: Int) -> Bool {
        guard let _ = ParkingData.isParkingLotExist(lotNumber: lot) else {
            return false
        }
        return true
    }
    
    /* MARK:- Func: isVehicleExists
     Input:
     vehicle - vehicle object
     Output:
     Return result if vehicle is present or not
     */
    private func isVehicleExists(_ vehicle: Vehicle) -> Bool {
        guard let _ = ParkingData.isVehiclePresent(withNumber: vehicle.vehicleId) else {
            return false
        }
        
        return true
    }
    
    /* MARK:- Func: isVehicleAndParkingLotExists
     Input:
     vehicle - vehicle object
     Output:
     Return result if vehicle is duplicate or not (true or false)
     */
    private func isVehicleAndParkingLotExists(_ vehicle: Vehicle) -> Bool {
        guard let _ = ParkingData.getParkedVehicle(withNumber: vehicle.vehicleId,
                                               lotNumber: vehicle.lotNumber) else {
                                                return false
        }
        return true
    }
    
    /* MARK:- Func: parkVehicleOnPlace
     Park Vehicle on Place
     Input:
     vehicle - vehicle object
     */
    private func parkVehicleOnPlace(_ vehicle: Vehicle) {
        ParkingData.parkVehicle(vehicle)
    }
}
