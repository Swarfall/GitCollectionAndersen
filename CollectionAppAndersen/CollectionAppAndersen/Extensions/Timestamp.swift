//
//  Extension.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 22.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970)
    }
}
