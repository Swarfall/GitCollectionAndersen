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
}

class MainPresenter {
    //MARK: - Private properties
    private var models = [BaseCellEntity]()
    
    //MARK: - Public properties
    var view: MainViewController?
    var requestManager = RequestManager()
    
    //MARK: Private funcs
    //MARK: - ADD
    private func putDataModel() -> [AddCellEntity] {
        let entity = AddCellEntity(cellType: AddCell.self) {
            self.dataForAddCellFromRequest()
            self.view?.reloadData()
        }
        
        return [entity]
    }
    
    private func dataForAddCellFromRequest() {
        guard let view = view else { return }
        view.showOverlay()
        requestManager.getData(numbers: { [weak self] (number, timestamp) in
            self?.createNewCell(number: number, timestamp: timestamp)
        }, fail: { (error) in
            view.errorAlert(title: error)
            view.hideOverlayView()
        })
    }
    
    private func createNewCell(number: Int, timestamp: String) {
        guard let view = view else { return }
        let cell = MainCellEntity(numberText: "\(number)", timestamp: "\(timestamp)", cellType: MainCell.self) {
            self.getDataForRemoveCell()
        }
        models.insert(cell, at: 0)
        view.hideOverlayView()
        view.reloadData()
    }
    
    //MARK: - REMOVE
    private func getDataForRemoveCell() { 
        guard let view = view else { return }
        view.showOverlay()
        var deleteNumberText = 0
        var index = 0
        self.requestManager.getForRemove(number: deleteNumberText, numberText: { (deletedNumber) in
            deleteNumberText = deletedNumber
            for removeNumber in self.models {
                print("removeNumber = \(removeNumber)")
                guard let removeNumber = removeNumber as? MainCellEntity else { return }
                if removeNumber.numberText == "\(deletedNumber)" {
                    self.models.remove(at: index)
                    view.hideOverlayView()
                } else {
                    index += 1
                }
            }
        }) { (error) in
            view.errorAlert(title: error)
            view.hideOverlayView()
        }
        
    }
    
    private func removeCellFromRequest() {
        guard let view = view else { return }
        view.showOverlay()
    }
}

extension MainPresenter: MainProtocol {
    //MARK: Protocol funcs
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
