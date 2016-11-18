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
        
    }

    @IBAction func onClicked(_ sender: UIButton) {
        
        Toast.show(type: .success, message: "修改成功")
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        
        Toast.dismiss()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

