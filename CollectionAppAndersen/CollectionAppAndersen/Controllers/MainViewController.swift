//
//  MainViewController.swift
//  CollectionAppAndersen
//
//  Created by Вячеслав Савицкий on 09.01.2020.
//  Copyright © 2020 Вячеслав Савицкий. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Private properties
    private var presenter = MainPresenter()
    
    //MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        presenter.view = self
        configCollectionView()
    }
    
    //MARK: - Private func
    private func configCollectionView() {
        collectionView.register(UINib(nibName: String(describing: MainCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MainCell.self))
        collectionView.register(UINib(nibName: String(describing: AddCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: AddCell.self))
    }
    
    //MARK: - Public funcs
    func reloadData() {
        collectionView.reloadData()
    }
    
    func deleteCell(by index: Int) {
        collectionView.deleteItems(at: [IndexPath(item: index, section: 0)])
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: Delegate funcs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.countItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = presenter.model(indexPath: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellModel.cellType), for: indexPath) as! BaseCell
        cell.delegate = self
        cell.update(model: cellModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if indexPath.item == presenter.lastIndexItem() {
            presenter.tapOnAdd()
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (self.view.frame.width / 3) - 10, height: (self.view.frame.width / 3) - 10)
        return size
    }
}

extension MainViewController: BaseCellDelegate {
    func didTapDelete(with model: CellModel) {
        presenter.tapOnDelete(model: model)
    }
}

