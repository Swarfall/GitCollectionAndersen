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
    func model(index: Int) -> AddCellEntity // from -> MainCellEntity
    func viewDidLoad()
    func tapOnAdd()
    func tapOnDelete(model: MainCellEntity)
    func lastIndexItem() -> Int
}

class MainPresenter {
    //MARK: - Private properties
    private var models = [AddCellEntity]()
    
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

    private func simulationRemoveRequest(cell: MainCellEntity) {
        let successPercent = Int.random(in: 1...100)
        successPercent < 31 ? view?.errorAlert() : deleteForIndex(cell: cell)
    }
    
    private func afterBlockForAddCell(seconds: Int, queue: DispatchQueue = .main) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            self.simulationAddRequest(time: "\(seconds)")
        }
    }
        
    private func afterBlockForRemoveCell(seconds: Int, queue: DispatchQueue = .main, cell: MainCellEntity) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            self.simulationRemoveRequest(cell: cell)
        }
    }
    
    private func simulationAddRequest(time: String) {
        let successPercent = Int.random(in: 1...100)
        successPercent < 31 ? view?.errorAlert() : addingCell(time: time)
    }
    
    private func addingCell(time: String) {
        let randomTitle: String = "\(Int.random(in: 1...100))"
        //переделать на вайл
        
        while time != randomTitle {
            let entity = MainCellEntity(cellType: MainCell.self, numberText: "\(time)", id: UUID().uuidString.lowercased(), timeRequest: time) { (entity) in
            self.tapOnAdd()
            //self.models.insert(entity, at: self.models.startIndex)
            }
        }
        self.view?.reloadData()
    }
    
    private func putDataModel() -> [AddCellEntity] {
//        let entity = AddCellEntity(cellType: AddCell.self) { () -> AddCellEntity in
//            return AddCellEntity.init(cellType: AddCell.self) { () -> AddCellEntity in
//
//            }
//        }
        let entity = AddCellEntity(cellType: AddCell.self) { () -> AddCellEntity in
            AddCellEntity(cellType: AddCell.self, complition: nil)
        }
        return [entity]
    }
}

extension MainPresenter: MainProtocol {
    //MARK: Protocol funcs
    func lastIndexItem() -> Int {
        let lastIndex = countItems() - 1
        return lastIndex
    }
    
    func tapOnDelete(model: MainCellEntity) {
        afterBlockForRemoveCell(seconds: Int.random(in: 1...10), cell: model)
        
    }

    func tapOnAdd() {
        requestManager.getNumber(completion: { [weak self] (completion) in
            self?.afterBlockForAddCell(seconds: completion)
            }, fail: nil)
    }
    
    func countItems() -> Int {
        return models.count
    }
    //  from BaseCellEntity -> AddCellEntity
    func model(index: Int) -> AddCellEntity {
        return models[index]
    }
    
    func viewDidLoad() {
        models = putDataModel()
    }
}
