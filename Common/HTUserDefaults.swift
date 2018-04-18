//
//  HTUserDefaults.swift
//  JinWei
//
//  Created by ting.hu on 2018/1/9.
//  Copyright © 2018年 精卫. All rights reserved.
//

import UIKit

class HTUserDefaults: NSObject {
    // MARK: - ------------ HTUserDefaults
    //存取key和value（String）
    class func HTUserDefaultsSet(key: String, obj: AnyObject) {
        return UserDefaults.standard.set(obj, forKey: key)
    }
    //存取key和value（bool）
    class func HTUserDefaultsSetBool(key: String, obj: Bool) {
        UserDefaults.standard.set(obj, forKey:key)
    }
    //获取对应key的存储
    class func HTUserDefaultsGet(key: String) -> AnyObject {
        return UserDefaults.standard.value(forKey: key) as AnyObject
    }
    //获取该key对用的返回bool
    class func HTUserDefaultsGetBool(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey:key)
    }
    //删除对应key的存储
    class func HTUserDefaultsRemove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    //判断此key是否存在
    class func HTUserDefaultsIsValue(key: String) -> Bool{
        return UserDefaults.standard.objectIsForced(forKey: key)
    }
    //同步
    class func HTUserDefaultsSyn() {
        UserDefaults.standard.synchronize()
    }
}
