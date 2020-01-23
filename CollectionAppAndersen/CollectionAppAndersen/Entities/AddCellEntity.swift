//
//  File.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 15.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation

 class AddCellEntity: BaseCellEntity {
    //MARK: - Public property
    var addCompletion: ((Bool) -> Void)
    
    init(cellType: BaseCell.Type, addCompletion: @escaping ((Bool) -> Void)) {
        self.addCompletion = addCompletion
        super.init(cellType: cellType)
    }
}

