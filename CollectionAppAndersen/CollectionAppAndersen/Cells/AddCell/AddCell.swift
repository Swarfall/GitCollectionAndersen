//
//  AddCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

class AddCell: BaseCell {

    var model: MainCellEntity!
    
    override func update(model: MainCellEntity) {
        self.model = model
    }
    
    @IBAction func didTapAddButton() {
        model.addCompletion(self.model)
    }
}
