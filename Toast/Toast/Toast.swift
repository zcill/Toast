//
//  Toast.swift
//  Toast
//
//  Created by Locke on 2016/11/18.
//  Copyright © 2016年 Meitu. All rights reserved.
//

import UIKit

final class Toast: UIView {
    
    struct ui {
        static let ScreenWidth = UIScreen.main.bounds.width
        static let ScreenHeight = UIScreen.main.bounds.height
        static let iconWidth : CGFloat = 25.0
        static let iconHeight : CGFloat = 25.0
        static let width = ui.ScreenWidth - 70.0
        static let height : CGFloat = 75.0
    }
    
    static let sharedInstance = Toast()
    
    var isShowing = false
    var message : String?
    var type : ToastType?
    
    enum ToastType {
        case success
        case error
        case warning
    }
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = #imageLiteral(resourceName: "icon_toast_green")
        iconImageView.frame = CGRect.init(x: 0, y: 0, width: ui.iconWidth, height: ui.iconHeight)
        iconImageView.center = CGPoint.init(x: 40, y: ui.height/2)
        return iconImageView
    }()
    
    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = ""
//        messageLabel.frame = CGRect.init(x: CGRect., y: 0, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.frame = CGRect.init(x: 0, y: 0, width: ui.width, height: ui.height)
        self.center = CGPoint.init(x: ui.ScreenWidth / 2, y: ui.ScreenHeight / 2)
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        self.layer.mask = layer
        
        self.addSubview(iconImageView)
        self.addSubview(messageLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func show(type: ToastType, message: String) -> Void {
        
        if sharedInstance.isShowing {
            return
        }
        
        switch type {
        case .success:
            sharedInstance.iconImageView.image = #imageLiteral(resourceName: "icon_toast_green")
        case .error:
            sharedInstance.iconImageView.image = #imageLiteral(resourceName: "icon_toast_red")
        case .warning:
            sharedInstance.iconImageView.image = #imageLiteral(resourceName: "icon_toast_orange")
        }
        
        sharedInstance.setupUI()
        
        sharedInstance.show(type: type, message: message)
    }
    
    func setupUI() -> Void {
        
        
        
    }
    
    func show(type: ToastType, message: String) -> Void {
        
        
        
        
        
        
    }
    
    
    

}
