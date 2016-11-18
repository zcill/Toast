//
//  ViewController.swift
//  ToastExample
//
//  Created by Locke on 2016/11/19.
//  Copyright © 2016年 Meitu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var successButton: UIButton!
    @IBOutlet weak var warningButton: UIButton!
    @IBOutlet weak var errorButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() -> Void {
        
        successButton.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.bottom.equalTo(self.view.snp.bottom)
            make.width.equalTo(self.view.snp.width).dividedBy(3)
            make.height.equalTo(70)
        }
        
        warningButton.snp.makeConstraints { (make) in
            make.leading.equalTo(successButton.snp.trailing)
            make.bottom.equalTo(self.view.snp.bottom)
            make.size.equalTo(successButton.snp.size)
        }
        
        errorButton.snp.makeConstraints { (make) in
            make.leading.equalTo(warningButton.snp.trailing)
            make.bottom.equalTo(self.view.snp.bottom)
            make.size.equalTo(successButton.snp.size)
        }
        
        
    }
    
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

