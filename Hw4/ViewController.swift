//
//  ViewController.swift
//  Hw4
//
//  Created by Alexander Lesnichy on 29.01.2018.
//  Copyright © 2018 Alexander Lesnichy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var typeNameLabel: UILabel!
    @IBOutlet weak var fuelCountLabel: UILabel!
    @IBOutlet weak var brakePercentLabel: UILabel!
    @IBOutlet weak var driverIsLiveLabel: UILabel!
    @IBOutlet weak var driveTextField: UITextField!
    @IBOutlet weak var jumpOnHillsTextField: UITextField!
    @IBOutlet weak var gasFuelIn: UITextField!
    @IBOutlet weak var motoImageView: UIImageView!
    
    let offroadBike = Motocycle.init(fuelCount: 100, brandName: "HONDA XR650L", driverIsLive: true, brakePercent: 100, driveDymension: .offroad)

    override func viewDidLoad() {
        super.viewDidLoad()

        motoImageView.image = UIImage.init(named: "Honda")

        setupData()

        print(offroadBike.drive(kilometers: 100))
        print(offroadBike.brake())
        print(offroadBike.jumpOnHills(metersHigh: 10))

        driveTextField.keyboardType = .decimalPad
        jumpOnHillsTextField.keyboardType = .decimalPad
    }

    func setupData() {
        typeNameLabel.text = offroadBike.brandName
        fuelCountLabel.text = "\(offroadBike.fuelCount)"
        brakePercentLabel.text = "\(offroadBike.brakePercent)"
        driverIsLiveLabel.text = "\(offroadBike.driverIsLive)"
    }

    @IBAction func drive(_ sender: UIButton) {
        let kmOfDistance = driveTextField.text

        if let kmOfDistance = kmOfDistance {
            if let kmOfDistanceDouble = Double(kmOfDistance) {
                offroadBike.drive(kilometers: kmOfDistanceDouble)
                setupData()
            } else {
                print("the text entered is not a number")
            }
        }
    }
    
    @IBAction func brake(_ sender: UIButton) {
        offroadBike.brake()
        setupData()
    }
    
    @IBAction func jumpOnHills(_ sender: UIButton) {
        let metersOfHeight = jumpOnHillsTextField.text

        if let metersOfHeight = metersOfHeight {
            if let metersOfHeightDouble = Double(metersOfHeight) {
                offroadBike.jumpOnHills(metersHigh: metersOfHeightDouble)
                setupData()
            } else {
                print("the text entered is not a number")
            }
        }
    }

    @IBAction func gasFuelIn(_ sender: UIButton) {
        let litresOfGas = gasFuelIn.text

        if let litresOfGas = litresOfGas {
            if let litresOfGasDouble = Double(litresOfGas) {
                offroadBike.gasFuelIn(litres: litresOfGasDouble)
                setupData()
            } else {
                print("the text entered is not a number")
            }
        }
    }
    
}

