//
//  PutDataNumberModel.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation
import UIKit

func putDataModel() -> [CellModel] {
    let addCell = CellModel(cellType: AddCell.self, numberText: nil)
    return [addCell]
}
