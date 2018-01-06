//
//  NWGlobalFormattingTool.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/5.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import UIKit
import Foundation


public func printLog<T>(_ message: T,
                        file: String = #file,
                        method: String = #function,
                        line: Int = #line) {
    #if DEBUG
        print("FILE POSTION => [\((file as NSString).lastPathComponent) \(method):] - [Line \(line)], OUTPUT INFO => 「 \(message) 」")
    #endif
}



public func kColor(_ r: CGFloat,
                   _ g: CGFloat,
                   _ b: CGFloat,
                   defaultAlpha: CGFloat = 1.0,
                   denominatorRGB: CGFloat = 255.0) -> UIColor {
    return UIColor(red: r/denominatorRGB, green: g/denominatorRGB, blue: b/denominatorRGB, alpha: defaultAlpha)
}



public func kColorAlpha(_ r: CGFloat,
                        _ g: CGFloat,
                        _ b: CGFloat,
                        _ a: CGFloat,
                        denominatorRGB: CGFloat = 255.0) -> UIColor {
    return UIColor(red: r/denominatorRGB, green: g/denominatorRGB, blue: b/denominatorRGB, alpha: a)
}



public func kFont(_ x: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: x)
}



public func kFontBold(_ x: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: x)
}



struct UIScreenAttribute {
    static let bounds = UIScreen.main.bounds
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

