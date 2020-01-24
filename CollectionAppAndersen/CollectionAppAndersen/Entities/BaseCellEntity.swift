//
//  BaseCellModel.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation
import UIKit

public class BaseCellEntity {
    //MARK: - Public property
    var cellType: BaseCell.Type
    
    init(cellType: BaseCell.Type) {
        self.cellType = cellType
    }
}

