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
        let entity = AddCellEntity(cellType: AddCell.self) { _ in 
            self.dataForAddCellFromRequest()
            self.view?.reloadData()
        }
        
        return [entity]
    }
    
    private func dataForAddCellFromRequest() {
        guard let view = view else { return }
        view.showOverlay(view: view.view)
        requestManager.getNumbers(numbers: { [weak self] (number, timestamp) in
            self?.doingForCell(number: number, timestamp: timestamp)
        }, fail: { (error) in
            view.errorAlert(title: error)
            view.hideOverlayView()
        })
    }
    
    private func doingForCell(number: Int, timestamp: String) {
        guard let view = view else { return }
        let cell = MainCellEntity(numberText: "\(number)", timestamp: "\(timestamp)", add: true, cellType: MainCell.self) { completion in
            if completion == false {
                self.getDataForRemoveCell()
            }
        }
        models.insert(cell, at: 0)
        view.hideOverlayView()
        view.reloadData()
    }
    
    //MARK: - REMOVE
    private func getDataForRemoveCell() {
        guard let view = view else { return }
        let entity = MainCellEntity(add: false, cellType: MainCell.self) { remove in
            view.showOverlay(view: view.view)
            var deleteNumberText: Int = 0
            self.requestManager.removeNumber(deleteNumber: deleteNumberText, numberText: { (number) in
                deleteNumberText = number
                print("")
            }) { (error) in
                view.errorAlert(title: error)
            }
        }
        view.reloadData()
    }
    
    private func removeAvailableCell() {
        guard let view = view else { return }
        let removeCell = MainCellEntity(add: false, cellType: MainCell.self) { remove in 
            
        }
    }
    
    private func removeCellFromRequest() {
        guard let view = view else { return }
        view.showOverlay(view: view.view)
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
