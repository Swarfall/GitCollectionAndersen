//
//  MainCell.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

class MainCell: BaseCell {
    //MARK: - Private outlets
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    //MARK: - Private property
    private var entity: MainCellEntity!
    
    //MARK: - Overriden public func
    override func update(entity: BaseCellEntity) {
        guard let entity = entity as? MainCellEntity else { return }
        numberLabel.text = entity.numberText
        timeLabel.text = entity.timestamp
        self.entity = entity.self
    }
    
    //MARK: - Private action func
    @IBAction private func didTapDeleteButton() {
        entity.removeCompletion(false)
    }
}
