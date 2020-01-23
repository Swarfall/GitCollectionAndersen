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
    var completion: ((Bool) -> Void)
    
    init(numberText: String = "", timestamp: String = "", add: Bool, cellType: BaseCell.Type, completion: @escaping ((Bool) -> Void)) {
        self.numberText = numberText
        self.timestamp = timestamp
        self.completion = completion
        super.init(cellType: cellType)
    }
    
    //MARK: - Public func
    public static func == (lhs: MainCellEntity, rhs: MainCellEntity) -> Bool {
        return true
    }
}
