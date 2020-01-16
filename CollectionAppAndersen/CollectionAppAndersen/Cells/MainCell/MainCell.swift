//
//  MainCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

 public class MainCell: BaseCell {

    //MARK: - Outlet
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK: - Property
    private var model: MainCellEntity!
    
    //MARK: Overriden func
    override func update(model: MainCellEntity) {
        self.model = model
        numberLabel.text = model.numberText
        timeLabel.text = model.timeRequest
    }
    
    //MARK: - Action
    @IBAction private func didTapDeleteButton() {
       // model.removeCompletion(model)
    }
}
