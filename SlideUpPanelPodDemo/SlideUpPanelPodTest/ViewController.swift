//
//  ViewController.swift
//  SlideUpPanelPodTest
//
//  Created by mac on 30/10/18.
//  Copyright © 2018 Dominator. All rights reserved.
//

import UIKit
import SlideUpPanel
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cardViewController : SlideUpPanel!
        cardViewController = SlideUpPanel(vc: self, cardHeight: nil)
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
    }


}

