//
//  AddCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

class AddCell: BaseCell {
    //MARK: - Private property
    private var entity: AddCellEntity!
    
    //MARK: - Public func
    override func update(entity: BaseCellEntity) {
        guard let entity = entity as? AddCellEntity else { return }
        self.entity = entity.self
    }

    //MARK: - Private action func
    @IBAction private func didTapAddButton() {
        entity.complition()
    }
}
