//
//  HTTGCDTimer.swift
//  JinWei
//
//  Created by tingtingHu on 2018/3/1.
//  Copyright © 2018年 精卫. All rights reserved.
//

import Foundation

class HTTGCDTimer: NSObject {
    //单例模式
    static let shareHTTGCDTimer = HTTGCDTimer()

    //通过字典存取该名字下的timer对象
    lazy var timerContainer = [String:DispatchSourceTimer]()
    /// GCD定时器
    ///
    /// - Parameters:
    ///   - name: 定时器名字
    ///   - timeInterval: 时间间隔
    ///   - queue: 队列
    ///   - repeatCount: 运行次数  当小于0时就是无限循环  当等于0者不执行 当大于0者执行相应的次数
    ///   - handle: 执行任务的闭包
    func scheduledDispatchTimer(name: String, timeInterval: TimeInterval, queue: DispatchQueue, repeatCount: Int, handle:@escaping (DispatchSourceTimer?, Int) -> Void) {
        //判断字符串是否为nil
        if name.isEmpty {
            return
        }
        //查询对应timer
        var timer = timerContainer[name]
        //判断是否存在timer （不存在就立即创建）
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
            timer?.resume()
            timerContainer[name] = timer
        }

        //重复执行任务
        var repeats = repeatCount
        //时间精度调整为0.1s
        timer?.schedule(deadline: .now(), repeating: timeInterval, leeway: DispatchTimeInterval.milliseconds(100))
        timer?.setEventHandler(handler: {
            //判断是否运行次数
            if repeats == 0 {
                //取消定时器
                self.cancleTimer(WithTimerName: name)
            } else if repeats > 0 {
                handle(timer, repeats) //执行有限次数运行
                repeats -= 1
            } else {
                handle(timer, repeats) //执行无限次数运行
            }
        })
    }

    /// 取消定时器
    ///
    /// - Parameter name: 定时器名字
    func cancleTimer(WithTimerName name: String?) {
        let timer = timerContainer[name!]
        if timer == nil {
            return
        }
        timerContainer.removeValue(forKey: name!)
        timer?.cancel()
    }

    // 检查定时器是否已存在
    ///
    /// - Parameter name: 定时器名字
    /// - Returns: 是否已经存在定时器
    func isExistTimer(WithTimerName name: String?) -> Bool {
        if timerContainer[name!] != nil {
            return true
        }
        return false
    }

}
