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
    //MARK: - Private property
    private var numbers = [Int]()
    
    //MARK: - Private func
    private func randomNumber(from: Int = 1, to: Int) -> Int {
        let persent = Int.random(in: from...to)
        return persent
    }
}

extension RequestManager: RequestManagerProtocol {
    //MARK: - Protocol func
    func getNumber(number: @escaping (Int) -> Void, fail: @escaping (String) -> Void, timeRequest: @escaping (Int) -> Void) {
        let seconds = randomNumber(to: 10)
        var random = randomNumber(to: 100)
        var randomFlag = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
//            if random > 30 {
//                for available in self.numbers {
//                    if available == random {
//                        random = self.randomNumber(to: 100)
//                    } else {
//                        number(available)
//                    }
//                }
//            } else {
//                fail("Error")
//            }
            
            while randomFlag {
                if random > 30 {
                    for available in self.numbers {
                        if available == random {
                            random = self.randomNumber(to: 100)
                        } else {
                            self.numbers.append(random)
                            randomFlag = false
                        }
                    }
                } else {
                    fail("Error")
                    
                }
            }
        }
    }
}
