//
//  ViewControllerSlideUpViewController.swift
//  SlideUpPanelPodTest
//
//  Created by mac on 30/10/18.
//  Copyright © 2018 Dominator. All rights reserved.
//

import UIKit
import SlideUpPanel
class ViewControllerSlideUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var cardViewController : SlideUpPanel!
        cardViewController = SlideUpPanel(vc: self, cardHeight: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyViewController") as! MyViewController
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        cardViewController.setViewControllerAsContent(controller: vc)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
