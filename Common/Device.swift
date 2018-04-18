//
//  Device.swift
//  JinWei
//
//  Created by ting.hu on 2018/1/26.
//  Copyright © 2018年 精卫. All rights reserved.
//

import Foundation
import UIKit

func postMethod() {
    let device  = UIDevice.current
    //应用程序信息
    let infoDictionary = Bundle.main.infoDictionary!
    let appDisplayName = infoDictionary["CFBundleDisplayName"] //程序名称
    let majorVersion = infoDictionary["CFBundleShortVersionString"]//主程序版本号
    let minorVersion = infoDictionary["CFBundleVersion"]//版本号（内部标示）
    let appVersion = majorVersion as! String
    //设备信息
    let iosVersion = device.systemVersion //iOS版本
    let identifierNumber = device.identifierForVendor //设备udid
    let systemName = device.systemName //设备名称
    let model = device.model //设备型号
    let modelName = device.modelNames //设备具体型号
    let localizedModel = device.localizedModel //设备区域化型号如A1533
    ////打印信息
    print("程序名称：\(String(describing: appDisplayName))")
    print("主程序版本号：\(appVersion)")
    print("内部版本号：\(String(describing: minorVersion))")
    print("iOS版本：\(iosVersion)")
    print("设备udid：\(String(describing: identifierNumber))")
    print("设备名称：\(systemName)")
    print("设备型号：\(model)")
    print("设备具体型号：\(modelName)")
    print("设备区域化型号：\(localizedModel)")
}


func getCurrentUUID()->String{
    let device  = UIDevice.current
    if let uuid = device.identifierForVendor {
        print (uuid)
        return String(describing: uuid)
    }
    return ""
}



//扩展UIDevice
extension UIDevice {
    //获取设备具体详细的型号
    var modelNames: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        print(identifier)
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1":                               return "iPhone 7 (CDMA)"
        case "iPhone9,3":                               return "iPhone 7 (GSM)"
        case "iPhone9,2":                               return "iPhone 7 Plus (CDMA)"
        case "iPhone9,4":                               return "iPhone 7 Plus (GSM)"

        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
        case "iPad7,3":                                 return "iPad pro10.5"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}
