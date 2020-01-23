////
////  RequestManager.swift
////  CollectionAppAndersen
////
////  Created by Вячеслав Савицкий on 13.01.2020.
////  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
////
//
import Foundation
import UIKit

protocol RequestManagerProtocol {
    func getData(numbers: @escaping (_ numberText: Int, _ timestamp: String ) -> Void, fail: @escaping (String) -> Void)
    func getForRemove(number: Int, numberText: @escaping (Int) -> Void, fail: @escaping (String) -> Void)
}

class RequestManager {
    //MARK: - Private properties
    private var numbers = [Int]()
    let maxSecondsRequest = 10
    let maxRandomNumber = 100
    let chanceError = 30
    
    //MARK: - Private func
    private func randomNumber(from: Int = 1, to: Int) -> Int {
        let persent = Int.random(in: from...to)
        return persent
    }
}

extension RequestManager: RequestManagerProtocol {
    //MARK: - Protocol funcs
    func getData(numbers: @escaping (_ numberText: Int, _ timestamp: String ) -> Void, fail: @escaping (String) -> Void) {
        let seconds = randomNumber(to: maxSecondsRequest)
        var number = randomNumber(to: maxRandomNumber)
        let chance = randomNumber(to: maxRandomNumber)
        var errorFlag = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
            while errorFlag {
                if chance > self.chanceError {
                    if !self.numbers.contains(number) {
                        self.numbers.append(number)
                        let timestamp = Date().currentTimeSeconds()
                        numbers(number, "\(timestamp)")
                        errorFlag = false
                    } else {
                        number = self.randomNumber(to: self.maxRandomNumber)
                    }
                } else {
                    fail("Error add")
                    errorFlag = false
                }
            }
        }
    }
    
    func getForRemove(number: Int, numberText: @escaping (Int) -> Void, fail: @escaping (String) -> Void) {
        let seconds = randomNumber(to: maxSecondsRequest)
        let chance = randomNumber(to: maxRandomNumber)
        var index = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
            if chance > self.chanceError {
                for availableNumber in self.numbers {
                    if number == availableNumber {
                        self.numbers.remove(at: index)
                    } else {
                        index += 1
                    }
                }
            } else {
                fail("Error remove")
            }
        }
    }
}
