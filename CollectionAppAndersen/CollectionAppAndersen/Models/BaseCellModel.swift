//
//  BaseCellModel.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation
import UIKit

class BaseCellModel {
    var cellType: BaseCell.Type
    
    init(cellType: BaseCell.Type) {
        self.cellType = cellType
    }
}

class CellModel: BaseCellModel {
    var numberText: String?
    
    init(cellType: BaseCell.Type, numberText: String?) {
        self.numberText = numberText
        super.init(cellType: cellType)
    }
}
