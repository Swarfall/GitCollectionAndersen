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
    func getNumber(numbers: @escaping (_ numberText: Int, _ timeRequest: Int ) -> Void, fail: @escaping (String) -> Void)
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
    func getNumber(numbers: @escaping (_ numberText: Int, _ timeRequest: Int ) -> Void, fail: @escaping (String) -> Void) {
        let seconds = randomNumber(to: maxSecondsRequest)
        var getRandomNumber = randomNumber(to: maxRandomNumber)
        var errorFlag = true
        var indexNumbersArr = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
            while errorFlag {
                if getRandomNumber > self.chanceError {
                    if self.numbers.count < indexNumbersArr {
                        if self.numbers[0] == getRandomNumber {
                            indexNumbersArr += 1
                            getRandomNumber = self.randomNumber(to: self.maxRandomNumber)
                        } else {
                            self.numbers.append(getRandomNumber)
                            numbers(getRandomNumber, seconds)
                            errorFlag = false
                        }
                    } 
                } else {
                 fail("Error 100500")
                }
            }
        }
    }
}
