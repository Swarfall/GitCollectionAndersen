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
    @IBOutlet private weak var collectionView: UICollectionView!

    //MARK: - Private properties
    private var presenter = MainPresenter()
    
    //MARK: - Public properties
    private var overlayView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    
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
    
    func errorAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func showOverlay(view: UIView) {
           overlayView.frame = CGRect(x: view.frame.width, y: view.frame.height, width: view.frame.width, height: view.frame.height)
           overlayView.center = view.center
           overlayView.backgroundColor = UIColor.lightGray
           overlayView.clipsToBounds = true
           overlayView.layer.cornerRadius = 10
           overlayView.alpha = 0.5

           activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
           activityIndicator.style = .medium
           activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)

           overlayView.addSubview(activityIndicator)
           view.addSubview(overlayView)

           activityIndicator.startAnimating()
       }

    public func hideOverlayView() {
           activityIndicator.stopAnimating()
           overlayView.removeFromSuperview()
       }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: Delegate funcs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.countItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = presenter.model(index: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellModel.cellType), for: indexPath) as! BaseCell
        cell.update(entity: cellModel)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (self.view.frame.width / 3) - 10, height: (self.view.frame.width / 3) - 10)
        return size
    }
}

