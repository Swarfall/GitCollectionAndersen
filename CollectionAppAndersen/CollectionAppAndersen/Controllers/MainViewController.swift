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
        reloadData()
    }
    
    private func reloadData() {
        collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: Delegate funcs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.countItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AddCell.self), for: indexPath) as! AddCell
        let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MainCell.self), for: indexPath) as! MainCell
    }
    
    
}
