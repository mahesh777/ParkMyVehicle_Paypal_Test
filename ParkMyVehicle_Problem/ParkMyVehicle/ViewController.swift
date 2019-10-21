//
//  ViewController.swift
//  ParkMyVehicle
//
//  Created by Abhijeet Upadhyay on 13/06/19.
//  Copyright © 2019 Abhijeet Upadhyay All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vehicleNumberInput: UITextField!
    @IBOutlet weak var parkingLotInput: UITextField!
    
    let parkingLot = ParkingLot()
    
    static let ALERT_TITLE = "Parking App"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tapGestureRecogniser)
        // Do any additional setup after loading the view.
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    //Provide the solution Mentioned in problem for this class
    @IBAction func parkVehicleNow(_ sender: UIButton) {
        let validateUserInputObj = validateUserInput()
        
        // check user input is valid
        if validateUserInputObj.isUserInputProper == false {
            return
        }
        
        // check vechile data is present
        guard let vehicle = validateUserInputObj.vehicle else {
            return
        }

        // park vehicle
        parkingLot.parkVehicle(vehicle) { (message) in
            DispatchQueue.main.async(execute: {
                self.showAlert(text: message)
            })
        }
    }
}

// MARK:- Helper Methods
extension ViewController {
    /* MARK:- Func: Validate User Inputs
     Input: Nothing
     Output:
     isUserInputProper - it will check and return userInputProper or not
     vehicle - it will return vehicle object if Data is proper
    */
    func validateUserInput() -> (isUserInputProper : Bool,
                                vehicle : Vehicle?) {
                                    
        var isUserInputProper = false
        
        guard let vehicleNumber = vehicleNumberInput.text, vehicleNumber.count > 0  else {
            self.showAlert(text: "Enter vehicle number")
            isUserInputProper = false
            return (isUserInputProper : isUserInputProper, vehicle : nil)
        }
        
        guard let vehicleNumberInt = Int(vehicleNumber) else {
            self.showAlert(text: "Invalid vehicle number. Please enter in digits only.")
            isUserInputProper = false
            return (isUserInputProper : isUserInputProper, vehicle : nil)
        }
        
        guard let lotNumber = parkingLotInput.text, lotNumber.count > 0 else {
            self.showAlert(text: "Enter parking lot number")
            isUserInputProper = false
            return (isUserInputProper : isUserInputProper, vehicle : nil)
        }
        
        guard let lotNumberInt = Int(lotNumber) else {
            self.showAlert(text: "Invalid parking lot number. Please enter in digits only.")
            isUserInputProper = false
            return (isUserInputProper : isUserInputProper, vehicle : nil)
        }
                                    
        let vehicle = Vehicle.init(vehicleNumber: vehicleNumberInt,
                                                               parkingLotNumber: lotNumberInt)
                                    
        isUserInputProper = true
        return (isUserInputProper : isUserInputProper, vehicle : vehicle)
    }
    
    /* MARK:- Func: displayMessage
     Description: To Display Alert Message
     text - Optional String Value
     */
    func showAlert(text: String) {
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertController = UIAlertController(title: ViewController.ALERT_TITLE,
                                                message: text,
                                                preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion:  nil)
    }
}

