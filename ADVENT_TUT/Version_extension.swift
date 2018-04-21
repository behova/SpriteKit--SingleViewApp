//
//  Version_extension.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import UIKit

// Calculates Version type
// TODO: add types 7-8plus

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
    static let isiphone4Orless = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight < 568.0
    static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 568.0
    static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 667.0
    static let isiPhone6Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 736.0
    static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxHeight == 812.0
    
    
    static let isiPad = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxHeight == 1024.0
    static let isiPadPro = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxHeight == 1366.0
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
