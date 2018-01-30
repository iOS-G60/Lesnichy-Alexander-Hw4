//
//  Motocycle.swift
//  Hw4
//
//  Created by Alexander Lesnichy on 29.01.2018.
//  Copyright © 2018 Alexander Lesnichy. All rights reserved.
//

import Foundation


//Задание 1
//Создать класс (любой: часы, телевизор, ноутбук, мотоцикл, трактор, самолет) который будет иметь 5 проперти (1 из них приватный) и минимум 3 метода (один из которых приватный должен быть).
//
//Во вью контролере создать экземпляр данного класса и вызывать эти методы. В консоль принтить то что делают функции данного экземпляра.

class Motocycle {

    var fuelCount: Double
    let brandName: String
    var driverIsLive: Bool
    var brakePercent: Double // Количество тормозного ресурса (процент тормозных колодок)
    let driveDymension: Surround

    private var emergencyBrakesCount: Int // Износ тормозов. Количество раз использования экстренного торможения, из-за которого они выходят из строя.

    init(fuelCount: Double,
         brandName: String,
         driverIsLive: Bool,
         brakePercent: Double,
         driveDymension: Surround,
         emergencyBrakesCount: Int = 0) {

        self.fuelCount = fuelCount
        self.brandName = brandName
        self.driverIsLive = driverIsLive
        self.brakePercent = brakePercent
        self.driveDymension = driveDymension
        self.emergencyBrakesCount = emergencyBrakesCount
    }

    func drive(kilometers: Double) {
        let fuelLoss = kilometers / 10 // Расход топлива 10 л на 100 км
        fuelCount -= fuelLoss
        print("Топлива осталось", "\(fuelCount)", "литров", separator: " ", terminator: "")

    }

    func gasFuelIn(litres: Double) {
        fuelCount += litres
    }
    
    func jumpOnHills(metersHigh: Double) {
        let jumpFuelLoss = metersHigh / 5 // Расход топлива 1 л на 5 метров высоты прыжка.
        fuelCount -= jumpFuelLoss
        print("Топлива осталось", "\(fuelCount)", "литров", separator: " ", terminator: "")
    }

    func brake() {
        emergencyBrakesCount += 1

        if emergencyBrakesCount % 3 == 0 {
            brakePercent -= 10
            print("Остаток тормозов", "\(brakePercent)", "%", separator: " ", terminator: "")
        }

        if brakePercent == 0 { // Если тормоза заканчиваются, то алилуя.
            driverIsLive = false
        }
        print("Остаток тормозов", "\(brakePercent)", "%", separator: " ", terminator: "")
    }
}

enum Surround {
    case sportstrack
    case city
    case offroad
}
