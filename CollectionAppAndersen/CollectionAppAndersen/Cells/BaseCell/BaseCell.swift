//
//  BaseCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

protocol BaseCellDelegate {
    func update(entity: BaseCellEntity)
}

class BaseCell: UICollectionViewCell, BaseCellDelegate {
    //MARK: - Private property
    private var entity: BaseCellEntity!
    
    //MARK: - Delegate funcs
    func update(entity: BaseCellEntity) {
        
    }
}
