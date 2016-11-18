//
//  ViewController.swift
//  ToastExample
//
//  Created by Locke on 2016/11/19.
//  Copyright © 2016年 Meitu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showSuccess(_ sender: UIButton) {
        Toast.show(type: .success, message: "设置成功~ ")
    }
    
    @IBAction func showWarning(_ sender: UIButton) {
        Toast.show(type: .warning, message: "设置中断 ! ")
    }
    
    @IBAction func showError(_ sender: UIButton) {
        Toast.show(type: .error, message: "设置错误 ! ")
    }

}

