//
//  ViewController2.swift
//  reusableDemo
//
//  Created by litt1e-p on 16/10/17.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit

class ViewController2: UIViewController
{
    static let kCollectionViewCellID: String = "kCollectionViewCellID"
    private let kHomeCellMargin: CGFloat = 5.0
    private let kHomeCellColumn: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        title = "normal demo"
        view.backgroundColor = .groupTableViewBackground
        view.addSubview(collectionView)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ViewController2.kCollectionViewCellID)
    }
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)
        cv.backgroundColor = .groupTableViewBackground
        cv.delegate = self;
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

extension ViewController2: UICollectionViewDataSource, UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        jumpToPage(ViewController())
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController2.kCollectionViewCellID, for: indexPath) as! CollectionViewCell
        return cell
    }
}
