//
//  MainCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

class MainCell: BaseCell {

    //MARK: - Outlets
    @IBOutlet weak var numberLabel: UILabel!
    
    //MARK: - Property
    private var model: CellModel!
    
    //MARK: Overriden funcs
    override func update(model: CellModel) {
        self.model = model
        numberLabel.text = model.numberText ?? ""
    }
    
    //MARK: - Actions
    @IBAction func didTapDeleteButton() {
        delegate?.didTapDelete(with: model)
    }
}
