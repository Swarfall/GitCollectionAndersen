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
    func getNumber(completion: @escaping (Int) -> Void, fail: ((String) -> Void)?, queue: DispatchQueue)
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
    func getNumber(completion: @escaping (Int) -> Void, fail: ((String) -> Void)?, queue: DispatchQueue = .global()) {
        var seconds = randomNumber(to: 10)
        queue.asyncAfter(deadline: .now() + 5) {
            if self.randomNumber(to: 100) < 31 {
                for numberText in self.numbers {
                    if numberText == self.randomNumber(to: 100) {
                        self.randomNumber(to: 100)
                        return
                    } else {
                        completion(self.randomNumber(to: 100))
                    }
                }
            }
        }
        //вызвать комплишн и вернуть, что получилось
    }
}
//  в презентере отреагировать на метод
