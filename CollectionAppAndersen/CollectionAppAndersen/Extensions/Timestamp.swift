//
//  Extension.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 22.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation

extension Date {
    func currentTimeSeconds() -> String {
        //Convert to Date
         let interval = Int64(self.timeIntervalSince1970)
        let date = Date(timeIntervalSince1970: TimeInterval(interval))

        //Date formatting
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMMM yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //NSTimeZone(name: "UTC")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
