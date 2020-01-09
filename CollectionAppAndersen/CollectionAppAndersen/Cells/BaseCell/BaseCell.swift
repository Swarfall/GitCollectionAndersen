//
//  BaseCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

protocol BaseCellDelegate {
    func didTapDelete(with model: CellModel)
    func update(model: CellModel)
}

class BaseCell: UICollectionViewCell, BaseCellDelegate {
    func didTapDelete(with model: CellModel) {
        
    }
    
    func update(model: CellModel) {
        
    }
}
