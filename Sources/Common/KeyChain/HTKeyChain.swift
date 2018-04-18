//
//  HTKeyChain.swift
//  JinWei
//
//  Created by ting.hu on 2018/1/9.
//  Copyright © 2018年 精卫. All rights reserved.
//

import UIKit

public class HTKeyChain: NSObject {
    func createDefaultKeyChainItemDic() -> NSMutableDictionary {
        let keyChainItem = NSMutableDictionary()
        keyChainItem.setObject(kSecClassInternetPassword as NSString, forKey: kSecClass as NSString)
        keyChainItem.setObject("eyoung.com/JinWei", forKey:  kSecAttrServer as NSString)
        keyChainItem.setObject("eyoung.com", forKey: kSecAttrAccount as NSString)
        return keyChainItem
    }

    /// 输出日志

    ///
    /// - parameter message:  日志消息
    /// - parameter logError: 错误标记，默认是false,如果是true,发布时仍然会输出
    /// - parameter file:     文件名
    /// - parameter method:   方法名
    /// - parameter line:     代码行数
   public func printLog<T>(message: T,
                     logError: Bool = false,
                     file: String = #file,
                     method: String = #function,
                     line: Int = #line) {
        if logError {
            print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        } else {
            #if DEBUG
                print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
            #endif
        }
    }

}
