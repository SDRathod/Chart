//
//  ViewController.swift
//  BarChart
//
//  Created by Samir Rathod on 23/11/17.
//  Copyright © 2017 Samir Rathod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scrollObj: UIScrollView!
    
    let barWidth : CGFloat =  25
    let barPadding : CGFloat = 25
    let arrChart : [CGFloat] = [55,45,67,80,35,67,55,80,90,150,110,800,789,476,10000]
    
    var maxmimum :CGFloat = 0
    var minimum : CGFloat = 0
    var barTotalHeight : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        maxmimum = arrChart.max()!
        minimum = arrChart.min()!
        
        barTotalHeight = scrollObj.frame.size.height - 100
        
        initBarView()
    }

    func initBarView() {
    
        var Xposition : CGFloat = 10
        
        for barValue in arrChart {
            if barValue > 0 {
                scrollObj.addSubview(addBarInScrollview(Xpos: Xposition, Ypos: 0, viewWidth: barWidth, viewHeight: barValue))
                scrollObj.addSubview(addBarInScrollview1(Xpos: Xposition, Ypos: 0, viewWidth: barWidth, viewHeight: barValue))
                Xposition = Xposition + barWidth + barPadding
            }
        }
        scrollObj.contentSize = CGSize(width: Xposition + 50, height: 0)
    }
    
    func addBarInScrollview(Xpos: CGFloat, Ypos: CGFloat, viewWidth: CGFloat, viewHeight: CGFloat ) -> UIView {
        let viewObj = UIView(frame: CGRect(x: Xpos, y: scrollObj.frame.height - getHeightOfBar(viewHeight: viewHeight), width: viewWidth, height: getHeightOfBar(viewHeight: viewHeight)))
        viewObj.backgroundColor = UIColor.red
        return viewObj;
    }
    
    func addBarInScrollview1(Xpos: CGFloat, Ypos: CGFloat, viewWidth: CGFloat, viewHeight: CGFloat ) -> UIView {
        let viewObj = UILabel(frame: CGRect(x: Xpos, y: scrollObj.frame.height - getHeightOfBar(viewHeight: viewHeight) - 30, width: viewWidth, height: 20))
        viewObj.backgroundColor = UIColor.green
        viewObj.text = "\(viewHeight)"
        return viewObj;
    }
    
    func getHeightOfBar(viewHeight : CGFloat) -> CGFloat {
        return ((viewHeight * 100) / maxmimum)
    }
    
}

