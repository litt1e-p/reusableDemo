//
//  ViewController.swift
//  reusableDemo
//
//  Created by litt1e-p on 16/10/17.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit
import ReusableKit

class ViewController: UIViewController
{
    struct Reusable {
        static let vcCell = ReusableCell<CollectionViewCell>(nibName: "CollectionViewCell")
    }
    
    private let kHomeCellMargin: CGFloat = 5.0
    private let kHomeCellColumn: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        title = "reusable demo"
        view.backgroundColor = .groupTableViewBackground
        view.addSubview(collectionView)
        collectionView.register(Reusable.vcCell)
    }
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)
        cv.backgroundColor = .groupTableViewBackground
        cv.dataSource = self
        return cv
    } ()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let lt = UICollectionViewFlowLayout()
        lt.minimumLineSpacing = self.kHomeCellMargin
        lt.minimumInteritemSpacing = self.kHomeCellMargin
        let l = (UIScreen.main.bounds.width - self.kHomeCellMargin * (self.kHomeCellColumn + 1)) / self.kHomeCellColumn
        lt.itemSize = CGSize(width: l, height: l)
        lt.sectionInset = UIEdgeInsetsMake(self.kHomeCellMargin, self.kHomeCellMargin, self.kHomeCellMargin, self.kHomeCellMargin)
        return lt
    } ()
    
    func jumpToPage(_ vc: UIViewController?) {
        guard vc != nil else {return}
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(Reusable.vcCell, for: indexPath)
        return cell
    }
}

