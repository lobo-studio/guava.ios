//
//  MyCardContentVC.swift
//  Goyava
//
//  Created by Susim Samanta on 16/02/16.
//  Copyright © 2016 LordAlexWorks. All rights reserved.
//

import UIKit

class MyCardContentVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var pageIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMyCardsLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setUpMyCardsLayout() {
        let layout = UICollectionViewFlowLayout()
        let gridNib = UINib(nibName: "MyCard", bundle: nil) as UINib
        self.collectionView.registerNib(gridNib, forCellWithReuseIdentifier: "MyCard")
        layout.scrollDirection = .Vertical
        let column = 2
        let itemWidth = floor((view.bounds.size.width - CGFloat(column - 1)) / CGFloat(column))
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.itemSize = CGSizeMake(itemWidth,itemWidth)
        self.collectionView.setCollectionViewLayout(layout, animated: false) { (isAnimated) -> Void in
            self.collectionView.reloadData()
        }
    }
    // MARK: Collection View Data Source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView!,numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(collectionView: UICollectionView!,cellForItemAtIndexPath indexPath: NSIndexPath!) ->UICollectionViewCell! {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCard",forIndexPath: indexPath) as! MyCard
        cell.refreshUIWithDatasource()
        return cell
    }
    func collectionView(collectionView: UICollectionView,didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("selected \(indexPath.row)")
    }
    
}