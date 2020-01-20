//
//  CellEntity.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 14.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation

public class MainCellEntity: BaseCellEntity, Equatable {
    var numberText: String
    var timeRequest: String
    
  //  var removeCompletion: ((CellEntity) -> Void)
    //static var addCompletion: ((MainCellEntity) -> Void)
    
    init(cellType: BaseCell.Type, numberText: String, timeRequest: String){
        self.numberText = numberText
        self.timeRequest = timeRequest
      //  self.removeCompletion = removeCompletion
       // self.addCompletion = addCompletion
        super.init(cellType: cellType)
    }
    
    //MARK: - Public func
    public static func == (lhs: MainCellEntity, rhs: MainCellEntity) -> Bool {
        return true
    }
}
