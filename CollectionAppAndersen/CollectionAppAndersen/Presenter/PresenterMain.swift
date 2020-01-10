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
    func afterBlock(seconds: Int, queue: DispatchQueue)
    func didPressDelete(model: CellModel)
    //func putItemFor(indexPathItems item: Int) ->
}

class MainPresenter {
    //MARK: - Private properties
    private var models = [CellModel]()
    
    //MARK: - Public properties
    var view: MainViewController?
}

extension MainPresenter: MainProtocol {
    // MARK: Protocol funcs
    func didPressDelete(model: CellModel) {
        var index = 0
        for deleteModel in models {
            if deleteModel.numberText == model.numberText {
                models.remove(at: index)
                view?.deleteCell(by: index)
            } else {
              index += 1
            }
        }
    }
    
    func afterBlock(seconds: Int, queue: DispatchQueue) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            self.simulationRequest()
            self.view?.reloadData()
        }
    }
    
    func tapOnAdd() {
        let time = Int.random(in: 1...10)
        afterBlock(seconds: time, queue: .main)
    }
    
    func errorAlert() {
        let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
        }))
        view?.present(alert, animated: true, completion: nil)
    }
    
    func simulationRequest() {
        let successPercent = Int.random(in: 1...100)
        successPercent < 31 ? self.errorAlert() : self.addCell()
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
