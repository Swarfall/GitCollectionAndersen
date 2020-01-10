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
    func addCell()
    func simulationRequest()
    func errorAlert()
    func tapOnAdd()
}

class MainPresenter {
    //MARK: - Private properties
    private var models = [CellModel]()
    
    //MARK: - Public properties
    var view: MainViewController?
}

extension MainPresenter: MainProtocol {
    // MARK: Protocol funcs
    func tapOnAdd() {
        simulationRequest()
        self.view?.reloadData()
    }
    
    func errorAlert() {
        let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
    
        }))
        view?.present(alert, animated: true, completion: nil)
    }
    
    func simulationRequest() {
        let time: DispatchTime = DispatchTime(uptimeNanoseconds: UInt64(Int.random(in: 1...10)))
        DispatchQueue.main.asyncAfter(deadline: time) {
            let successPercent = Int.random(in: 1...100)
            successPercent < 31 ? self.errorAlert() : self.addCell()
        }
    }
    
    func addCell() {
        models.insert(CellModel(cellType: MainCell.self, numberText: "\(Int.random(in: 1...100))"), at: models.startIndex)
    }
    
    func countItems() -> Int {
        return models.count
    }
    
    func model(indexPath: Int) -> CellModel {
        return models[indexPath]
    }
    
    func viewDidLoad() {
        models = putDataModel()
    }
}
