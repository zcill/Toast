//
//  Toast.swift
//  Toast
//
//  Created by Locke on 2016/11/18.
//  Copyright © 2016年 Meitu. All rights reserved.
//

import UIKit

final class Toast: UIView {
    
    private struct ui {
        static let ScreenWidth = UIScreen.main.bounds.width
        static let ScreenHeight = UIScreen.main.bounds.height
        static let iconWidth : CGFloat = 25.0
        static let iconHeight : CGFloat = 25.0
        static let width = ui.ScreenWidth - 70.0
        static let height : CGFloat = 75.0
    }
    
    static let sharedInstance = Toast()
    
    private var isShowing = false
    private var message : String?
    private var type : ToastType?
    fileprivate var delay : TimeInterval? = 0
    
    enum ToastType {
        case success
        case error
        case warning
    }
    
    fileprivate lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = #imageLiteral(resourceName: "icon_toast_green")
        iconImageView.frame = CGRect.init(x: 0, y: 0, width: ui.iconWidth, height: ui.iconHeight)
        iconImageView.center = CGPoint.init(x: 40, y: ui.height/2)
        return iconImageView
    }()
    
    fileprivate lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.frame = CGRect.init(x: 40 + 30, y: ui.height/2 - 25/2, width: 200, height: ui.iconHeight)
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    
    deinit {
        self.layer.removeAllAnimations()
        
        iconImageView.removeFromSuperview()
        messageLabel.removeFromSuperview()
        
        self.removeFromSuperview()
        
        print("Toast did deinit")
    }
    
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
    
    // MARK: - Public
    
    class func show(type: ToastType, message: String) -> Void {
        
        show(type: type, message: message, delay: 2)
    }
    
    class func show(type: ToastType, message: String, delay: TimeInterval) -> Void {
        
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
        
        sharedInstance.delay = delay
        
        sharedInstance.setupUI(message: message)
        sharedInstance.show()
    }
    
    class func dismiss() -> Void {
        
        if !sharedInstance.isShowing {
            return
        }
        
        sharedInstance.dismiss()
    }
    
    // MARK: - Private
    
    private func setupUI(message: String) -> Void {
        
        messageLabel.text = message
    }
    
    private func show() -> Void {
        
        self.layer.opacity = 0
        
        let appDelegate = UIApplication.shared.delegate
        if let window = appDelegate?.window {
            window?.addSubview(self)
        }
        
        showAnim()
    }
    
    private func dismiss() -> Void {
        
        dismissAnim()
    }
    
    // MARK: - Animation
    
    private func showAnim() -> Void {
        
        let group = self.anim(isShow: true)
        isShowing = true
        self.layer.add(group, forKey: "showAnim")
    }
    
    fileprivate func dismissAnim() -> Void {
        
        let dismissAnim = self.anim(isShow: false)
        isShowing = false
        self.layer.add(dismissAnim, forKey: "dismissAnim")
    }
}

extension Toast : CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim.isEqual(self.layer.animation(forKey: "dismissAnim")) {
            
            self.removeFromSuperview()
            
        } else if anim.isEqual(self.layer.animation(forKey: "showAnim")) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay!, execute: {
                self.dismissAnim()
            })
        }
    }
}

extension Toast {
    
    func anim(isShow: Bool) -> CAAnimationGroup {
        
        let scaleAnim = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnim.values = isShow ? [0.9, 1.0] : [1.0, 0.9]
        scaleAnim.duration = 0.15
        
        let showAnim = CABasicAnimation(keyPath: "opacity")
        showAnim.fromValue = isShow == true ? 0 : 1
        showAnim.toValue = isShow == true ? 1 : 0
        showAnim.duration = 0.15
        
        let group = CAAnimationGroup()
        group.animations = [scaleAnim, showAnim]
        group.duration = 0.15
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        group.delegate = self
        
        return group
    }
    
}
