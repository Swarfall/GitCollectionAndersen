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
    func getNumber(number: @escaping (Int) -> Void, fail: @escaping (String) -> Void, timeRequest: @escaping (Int) -> Void)
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
    //MARK: - Protocol func
    func getNumber(number: @escaping (Int) -> Void, fail: @escaping (String) -> Void, timeRequest: @escaping (Int) -> Void) {
        let seconds = randomNumber(to: maxSecondsRequest)
        var random = randomNumber(to: maxRandomNumber)
        var errorFlag = true
        var indexNumbersArr = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
            while errorFlag {
                if random > self.chanceError {
                    if self.numbers.count < indexNumbersArr {
                        if self.numbers[0] == random {
                            indexNumbersArr += 1
                            random = self.randomNumber(to: self.maxRandomNumber)
                        } else {
                            self.numbers.append(random)
                            number(random)
                            errorFlag = false
                        }
                    } else {
                        print("self.numbers.count > indexNumbersArr")
                    }
                } else {
                 fail("Error 100500")
                }
            }
        }
    }
}
