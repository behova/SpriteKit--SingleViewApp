//
//  Version_extension.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import UIKit
import SpriteKit

// Calculates Version type

enum UIUserInterfaceIdiom: Int {
    case undefined
    case phone
    case pad
}

struct ScreenSize {
    // call width/height to dynamically size an sk scene (cgfloats)
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxHeight = max(ScreenSize.width, ScreenSize.height)
    static let minHeight = min(ScreenSize.width, ScreenSize.height)
}

struct DeviceType {
    // TODO: add types 7-8plus
    static let isiphone4Orless = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight < 568.0
    static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 568.0
    static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 667.0
    static let isiPhone6Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 736.0
    static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 812.0
    
    
    static let isiPad = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxHeight == 1024.0
    static let isiPadPro = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxHeight == 1366.0
}

public extension CGFloat {
    // TODO: Complete device type listing
    public static func universalFont(size: CGFloat) -> CGFloat {
        if DeviceType.isiphone4Orless {
            return size * 0.6
        }
        if DeviceType.isiPhone6 {
            return size * 1.0
        }
        if DeviceType.isiPhoneX {
            return size * 1.0
        } else {
            return size
        }
    }
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    public static func random(_ min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}
extension SKSpriteNode {
    
    func popUp(after: CGFloat = 0.0, sequenceNumber: Int = 1) {
        let action2Duration = 0.2
        let action3Duration = 0.06
        let action4Duration = 0.1
        let action5Duration = 0.05
        let totalTimeOfPopUpAnimation = action2Duration + action3Duration + action4Duration + action5Duration
        let action0 = SKAction.scale(to: 0.0, duration: 0.0)
        let action1 = SKAction.wait(forDuration: TimeInterval(CGFloat(sequenceNumber) * CGFloat(totalTimeOfPopUpAnimation) + after))
        let action2 = SKAction.scale(to: 1.1, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.05, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action0, action1, action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func popDown(after: CGFloat = 0.0, sequenceNumber: Int = 1) {
        let action2Duration = 0.1
        let action3Duration = 0.03
        let action4Duration = 0.05
        let action5Duration = 0.02
        let totalTimeOfPopUpAnimation = action2Duration + action3Duration + action4Duration + action5Duration
        let action0 = SKAction.scale(to: 1.0, duration: 0.0)
        let action1 = SKAction.wait(forDuration: TimeInterval(CGFloat(sequenceNumber) * CGFloat(totalTimeOfPopUpAnimation) + after))
        let action2 = SKAction.scale(to: 1.9, duration: action2Duration)
        let action3 = SKAction.scale(to: 1.7, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.85, duration: action4Duration)
        let action5 = SKAction.scale(to: 0.0, duration: action5Duration)
        let sequence = SKAction.sequence([action0, action1, action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func bounce() {
        let action2Duration = 0.3
        let action3Duration = 0.12
        let action4Duration = 0.2
        let action5Duration = 0.1
        let action2 = SKAction.scale(to: 1.2, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.1, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func bounceLockedButton() {
        let action2Duration = 0.15
        let action3Duration = 0.06
        let action4Duration = 0.1
        let action5Duration = 0.05
        let action2 = SKAction.scale(to: 1.2, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.1, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func bounceCookie() {
        let action2Duration = 0.3
        let action3Duration = 0.12
        let action4Duration = 0.2
        let action5Duration = 0.1
        let action2 = SKAction.scale(to: 1.6, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.3, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func rotate(speed: Int, clockWise: Bool) {
        let angel = clockWise ? CGFloat(-.pi/2.0) : CGFloat(.pi/2.0)
        let rotateForever = SKAction.repeatForever(SKAction.rotate(byAngle: angel, duration: TimeInterval(speed)))
        self.run(rotateForever)
    }
    
    func swing(speed: Int, startClockWise: Bool, angle: CGFloat) {
        let swingRight = SKAction.rotate(toAngle: .pi/angle, duration: TimeInterval(speed))
        let swingLeft = SKAction.rotate(toAngle: -.pi/angle, duration: TimeInterval(speed))
        let sequence = startClockWise ? SKAction.sequence([swingRight, swingLeft]) : SKAction.sequence([swingLeft, swingRight])
        let swingForever = SKAction.repeatForever(sequence)
        self.run(swingForever)
    }
    
    func slide(speed: Int, distanceX: CGFloat, distanceY: CGFloat) {
        let slide = SKAction.moveBy(x: distanceX , y: distanceY, duration: TimeInterval(speed))
        let slideBack = SKAction.moveBy(x: -distanceX , y: -distanceY, duration: TimeInterval(speed))
        let slideLeftRight = SKAction.sequence([slide, slideBack])
        let slideForever = SKAction.repeatForever(slideLeftRight)
        self.run(slideForever)
    }
    
    func fadeUp() {
        let randomWait = SKAction.wait(forDuration: TimeInterval(CGFloat.random(0.0, max: 0.2)))
        let growAction = SKAction.scale(to: CGFloat.random(3.0, max: 5.0), duration: TimeInterval(CGFloat.random(1.0, max: 1.5)))
        let fadeOutAction = SKAction.fadeOut(withDuration: TimeInterval(CGFloat.random(1.0, max: 1.5)))
        let group = SKAction.group([growAction, fadeOutAction])
        self.run(SKAction.sequence([randomWait, group]))
    }
}

extension SKLabelNode {
    func popUp(after: CGFloat = 0.0, sequenceNumber: Int = 1) {
        let action2Duration = 0.2
        let action3Duration = 0.06
        let action4Duration = 0.1
        let action5Duration = 0.05
        let totalTimeOfPopUpAnimation = action2Duration + action3Duration + action4Duration + action5Duration
        let action0 = SKAction.scale(to: 0.0, duration: 0.0)
        let action1 = SKAction.wait(forDuration: TimeInterval(CGFloat(sequenceNumber) * CGFloat(totalTimeOfPopUpAnimation) + after))
        let action2 = SKAction.scale(to: 1.1, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.05, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action0, action1, action2, action3, action4, action5])
        self.run(sequence)
    }
}


extension UIView {
    
    func fillSuperView() {
        
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    
    func anchorSize(to view:UIView) {
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    
    func anchor(top: NSLayoutYAxisAnchor?, leading:NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing:NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        
    }
}


