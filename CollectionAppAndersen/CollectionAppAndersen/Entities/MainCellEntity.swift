//
//  CellEntity.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 14.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation

 class MainCellEntity: BaseCellEntity, Equatable {
    //MARK: - Public propery
    var numberText: String
    var timestamp: String
    var removeCompletion: (() -> Void)
    
    init(numberText: String = "", timestamp: String = "", cellType: BaseCell.Type = MainCell.self, removeCompletion: @escaping (() -> Void)) {
        self.numberText = numberText
        self.timestamp = timestamp
        self.removeCompletion = removeCompletion
        super.init(cellType: cellType)
    }
    
    //MARK: - Public func
    public static func == (lhs: MainCellEntity, rhs: MainCellEntity) -> Bool {
        return true
    }
}
