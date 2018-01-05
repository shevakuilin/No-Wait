//
//  NWGlobalFormattingTool.swift
//  No Wait
//
//  Created by ShevaKuilin on 2018/1/5.
//  Copyright © 2018年 ShevaKuilin. All rights reserved.
//

import UIKit
import Foundation

/** 格式化print输出
 *
 *  @param message  自定义显示内容 [e.g., "array.first"]
 *  @param file     包含这个符号的⽂件的路径
 *  @param method   包含这个符号的⽅法名字
 *  @param line     符号出现处的⾏号
 *
 */
public func printLog<T>(_ message: T,
                        file: String = #file,
                        method: String = #function,
                        line: Int = #line) {
    #if DEBUG
        print("文件位置 => [\((file as NSString).lastPathComponent) \(method):] - [Line \(line)], 输出内容 => 「 \(message) 」")
    #endif
}



/** 格式化UIColor [默认alpha]
 *
 *  @param r    red值
 *  @param g    green值
 *  @param b    blue值
 *
 */
public func kColor(_ r: CGFloat,
                   _ g: CGFloat,
                   _ b: CGFloat,
                   defaultAlpha: CGFloat = 1.0,
                   denominatorRGB: CGFloat = 255.0) -> UIColor {
    return UIColor(red: r/denominatorRGB, green: g/denominatorRGB, blue: b/denominatorRGB, alpha: defaultAlpha)
}



/** 格式化UIColor [自定义alpha]
 *
 *  @param r    red值
 *  @param g    green值
 *  @param b    blue值
 *  @param a    alpha值
 *
 */
public func kColorAlpha(_ r: CGFloat,
                        _ g: CGFloat,
                        _ b: CGFloat,
                        _ a: CGFloat,
                        denominatorRGB: CGFloat = 255.0) -> UIColor {
    return UIColor(red: r/denominatorRGB, green: g/denominatorRGB, blue: b/denominatorRGB, alpha: a)
}



/** 格式化UIFont [系统默认]
 *
 *  @param x    字体size
 *
 */
public func kFont(_ x: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: x)
}



/** 格式化UIFont [加粗]
 *
 *  @param x    字体size
 *
 */
public func kFontBold(_ x: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: x)
}



struct UIScreenAttribute {
    static let bounds = UIScreen.main.bounds
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

