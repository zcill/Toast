//
//  ViewController.swift
//  Toast
//
//  Created by Locke on 2016/11/18.
//  Copyright © 2016年 Meitu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let toast = Toast(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        self.view.addSubview(toast)
        
        print(toast.iconImageView.frame)
    }

    @IBAction func onClicked(_ sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

