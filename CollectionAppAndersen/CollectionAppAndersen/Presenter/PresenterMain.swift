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
    func model(index: Int) -> BaseCellEntity
    func viewDidLoad()
    func dataForCellFromRequest()
    func tapOnDelete(model: MainCellEntity)
    func lastIndexItem() -> Int
}

class MainPresenter {
    //MARK: - Private properties
    private var models = [BaseCellEntity]()
    private var addCell: AddCell?
    
    //MARK: - Public properties
    var view: MainViewController?
    var loading: LoadingOverlay?
    var requestManager = RequestManager()
    
    //MARK: Private funcs
    private func deleteForIndex(cell: MainCellEntity) {
       var index = 0
        for deleteModel in self.models {
            //if deleteModel.id == cell.id {
                self.models.remove(at: index)
                self.view?.deleteCell(by: index)
                self.view?.reloadData()
                return
//            } else {
//                index += 1
//            }
        }
    }

//    private func simulationRemoveRequest(cell: MainCellEntity) {
//        let successPercent = Int.random(in: 1...100)
//        successPercent < 31 ? view?.errorAlert() : deleteForIndex(cell: cell)
//    }
    
    private func createNewCell(number: Int, timeRequest: Int) {
        let newCell = MainCellEntity(cellType: MainCell.self, numberText: "\(number)", timeRequest: "\(timeRequest)")
        models.insert(newCell, at: lastIndexItem())
    }
        
//    private func afterBlockForRemoveCell(seconds: Int, queue: DispatchQueue = .main, cell: MainCellEntity) {
//        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
//            self.simulationRemoveRequest(cell: cell)
//        }
    
//    private func simulationAddRequest(time: String) {
//        let successPercent = Int.random(in: 1...100)
//        successPercent < 31 ? view?.errorAlert() : addingCell(time: time)
//    }
    
//    private func addingCell(time: String) {
//        let randomTitle: String = "\(Int.random(in: 1...100))"
//        while time != randomTitle {
//            let entity = BaseCellEntity(cellType: MainCell.self, numberText: "\(time)", id: UUID().uuidString.lowercased(), timeRequest: time) { (entity) in
//            self.tapOnAdd()
//            //self.models.insert(entity, at: self.models.startIndex)
//            }
//        }
//        self.view?.reloadData()
//    }
    
    private func putDataModel() -> [AddCellEntity] {
        let entity = AddCellEntity(cellType: AddCell.self) {
            //self.models.append(BaseCellEntity(cellType: MainCell.self))
            self.dataForCellFromRequest()
            self.view?.reloadData()
        }
        
        return [entity]
    }
}

extension MainPresenter: MainProtocol {
    //MARK: Protocol funcs
    func tapOnDelete(model: MainCellEntity) {
        
    }
    
    func lastIndexItem() -> Int {
        let lastIndex = countItems() - 1
        return lastIndex
    }

    func dataForCellFromRequest() {
        var numberText: Int?
        var reqTimeText: Int?
        
        requestManager.getNumber(number: { (number) in
            numberText = number
        }, fail: { [weak self] (errorText) in
            self?.view?.errorAlert(title: errorText)
        }, timeRequest: {(reqTime) in
            reqTimeText = reqTime
        })
        
        createNewCell(number: numberText ?? 123, timeRequest: reqTimeText ?? 123)
    }
    
    func countItems() -> Int {
        return models.count
    }

    func model(index: Int) -> BaseCellEntity {
        return models[index]
    }
    
    func viewDidLoad() {
        models = putDataModel()
    }
}
