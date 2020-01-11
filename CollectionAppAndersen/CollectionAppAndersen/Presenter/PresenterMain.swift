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
    func simulationAddRequest()
    func simulationRemoveRequest(cell: CellModel)
    func errorAlert()
    func tapOnAdd()
    func afterBlockForAddCell(seconds: Int, queue: DispatchQueue)
    func afterBlockForRemoveCell(seconds: Int, queue: DispatchQueue, cell: CellModel)
    func tapOnDelete(model: CellModel)
    func deleteForIndex(cell: CellModel)
}

class MainPresenter {
    //MARK: - Private properties
    private var models = [CellModel]()
    
    //MARK: - Public properties
    var view: MainViewController?
}

extension MainPresenter: MainProtocol {
    // MARK: Protocol funcs
    func deleteForIndex(cell: CellModel) {
        var index = 0
        for deleteModel in self.models {
            if deleteModel.uuid == cell.uuid {
                self.models.remove(at: index)
                self.view?.deleteCell(by: index)
                self.view?.reloadData()
                return
            } else {
                index += 1
            }
        }
    }
    
    func simulationRemoveRequest(cell: CellModel) {
        let successPercent = Int.random(in: 1...100)
        successPercent < 31 ? errorAlert() : deleteForIndex(cell: cell)
    }
    
    func tapOnDelete(model: CellModel) {
        afterBlockForRemoveCell(seconds: Int.random(in: 1...10), queue: .main, cell: model)
    }
    
    func afterBlockForAddCell(seconds: Int, queue: DispatchQueue) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            self.simulationAddRequest()
        }
    }
        
    func afterBlockForRemoveCell(seconds: Int, queue: DispatchQueue, cell: CellModel) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            self.simulationRemoveRequest(cell: cell)
        }
    }
    
    func tapOnAdd() {
        self.afterBlockForAddCell(seconds: Int.random(in: 1...10), queue: .main)
    }
    
    func errorAlert() {
        let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
        }))
        view?.present(alert, animated: true, completion: nil)
    }
    
    func simulationAddRequest() {
        let successPercent = Int.random(in: 1...100)
        successPercent < 31 ? errorAlert() : addCell()
    }
    
    func addCell() {
        models.insert(CellModel(cellType: MainCell.self, numberText: "\(Int.random(in: 1...100))", uuid: UUID().uuidString.lowercased()), at: models.startIndex)
        view?.reloadData()
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
