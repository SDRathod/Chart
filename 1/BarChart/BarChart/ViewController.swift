//
//  ViewController.swift
//  BarChart
//
//  Created by Samir Rathod on 02/12/17.
//  Copyright © 2017 Samir Rathod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collBarChart: UICollectionView!
    
    var arrData: [Int] = [10, 40, 60, 100, 80, 1000, 200, 300, 30, 20, 50, 90, 2960, 560, 806, 70, 10, 402, 520, 680, 930, 430, 100, 670, 560, 250]
    var collHeight: CGFloat = 400
    var collWidth: CGFloat = 0
    
    var maxVal: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        collHeight = (((appDelegate.window?.frame.width)! - 20) * CGFloat(400)) / CGFloat(300)
        collWidth = ((appDelegate.window?.frame.width)! - 20) / CGFloat(arrData.count)
        if (collWidth < 5) {
            collWidth = 5
        }
        maxVal = arrData.max()!
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: collWidth, height: collHeight)
        layout.scrollDirection = .horizontal
        collBarChart.setCollectionViewLayout(layout, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collBarChart.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BarCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarCollCell", for: indexPath) as! BarCollCell
        
        cell.lblBar.backgroundColor = UIColor(red: .random(), green: .random(), blue: .random(), alpha: 0.7)
        
        let floatPer: CGFloat = (CGFloat(arrData[indexPath.row]) * CGFloat(100)) / CGFloat(maxVal)
        cell.lblBarHeight.constant = CGFloat((floatPer * collHeight) / CGFloat(100))
        
        return cell
        
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
