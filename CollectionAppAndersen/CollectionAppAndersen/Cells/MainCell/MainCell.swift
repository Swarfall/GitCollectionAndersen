//
//  MainCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

class MainCell: BaseCell {
    //MARK: - Outlet
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK: - Property
    private var entity: MainCellEntity!
    
    //MARK: Overriden func
    override func update(entity: BaseCellEntity) {
        guard let entity = entity as? MainCellEntity else { return }
        numberLabel.text = entity.numberText
        timeLabel.text = entity.timeRequest
    }
    
    //MARK: - Action
    @IBAction private func didTapDeleteButton() {
       // model.removeCompletion(model)
    }
}
