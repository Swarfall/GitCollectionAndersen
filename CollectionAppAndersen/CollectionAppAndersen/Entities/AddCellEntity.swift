//
//  File.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 15.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation

public class AddCellEntity: BaseCellEntity {
    var complition: (() -> AddCellEntity)
    
    init(cellType: BaseCell.Type ,complition: @escaping (() -> AddCellEntity) ) {
        self.complition = complition
        super.init(cellType: cellType)
    }
}

