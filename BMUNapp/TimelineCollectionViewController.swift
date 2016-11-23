//
//  TimelineCollectionViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 11/12/16.
//  Copyright © 2016 Jake Moskowitz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "committeeCollectionCell"

class TimelineCollectionViewController: UICollectionViewController {
    
    init() {
        super.init(nibName: "TimelineCollectionViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let nib: UINib = UINib(nibName: "CommitteesCollectionViewCell", bundle: nil)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        let width = self.view.bounds.width
        let flowLayout = CollectionViewFlowLayout()
        flowLayout.headerReferenceSize = CGSize(width: width, height: 20)
        flowLayout.footerReferenceSize = CGSize(width: width, height: 20)
        self.collectionView?.collectionViewLayout = flowLayout
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        self.collectionView?.allowsSelection = true
        self.collectionView?.allowsMultipleSelection = false
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let label = cell.viewWithTag(1) as? UILabel
        switch(indexPath.row) {
        case 0:
            label!.text = Storage.dayOneTimeline?["date"] as? String
        case 1:
            label!.text = Storage.dayTwoTimeline?["date"] as? String
        case 2:
            label!.text = Storage.dayThreeTimeline?["date"] as? String
        default:
            label!.text = "nil"
        }
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TimelineEventsCollectionViewController(section: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}
