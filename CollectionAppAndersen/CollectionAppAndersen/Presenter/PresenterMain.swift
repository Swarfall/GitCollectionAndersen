//
//  PresenterMain.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import Foundation
import UIKit

protocol MainProtocol {
    func countItems() -> Int
    func model(indexPath: Int) -> CellModel
    func viewDidLoad()
}

class MainPresenter {
    //MARK: - Private properties
    private var model = [CellModel]()
    
    //MARK: - Public properties
    var view: MainViewController?
}

extension MainPresenter: MainProtocol {
    func countItems() -> Int {
        return model.count
    }
    
    func model(indexPath: Int) -> CellModel {
        return model[indexPath]
    }
    
    func viewDidLoad() {
        model = putDataModel()
    }
}
