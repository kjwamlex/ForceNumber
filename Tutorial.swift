//
//  Tutorial.swift
//  ForceNumber
//
//  Created by 김준우 on 2016. 7. 5..
//  Copyright © 2016년 김준우. All rights reserved.
//

import UIKit

class tutorialForThreeD: UIViewController {
    
    @IBOutlet var maintouchview: CircularForceView!
    
    @IBOutlet var maintimerView: CircularTimerView!
    
    override func viewDidLoad() {
        maintouchview.progress = 1
        maintimerView.progress = 1
    }
}
