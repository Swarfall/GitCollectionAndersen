//
//  BaseCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

protocol BaseCellDelegate {
    func update(model: MainCellEntity)
}

public class BaseCell: UICollectionViewCell, BaseCellDelegate {
    //MARK: - Delegate funcs
    func update(model: MainCellEntity) {
        
    }
}
