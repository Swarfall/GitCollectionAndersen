//
//  File.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 15.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation

public class AddCellEntity: BaseCellEntity {
    //MARK: - Public property
    public var complition: (() -> Void)
    
    init(cellType: BaseCell.Type ,complition: @escaping (() -> Void)) {
        self.complition = complition
        super.init(cellType: cellType)
    }
}

