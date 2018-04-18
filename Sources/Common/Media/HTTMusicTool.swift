//
//  HTTMusicTool.swift
//  HTTMusic
//
//  Created by tingtingHu on 2018/4/9.
//  Copyright © 2018年 tingtingHu. All rights reserved.
//


import AVFoundation
import MediaPlayer

public class HTTMusicTool: NSObject {
    //单利化
   public static let sharedInstance = HTTMusicTool()
    //定义一个播放器的变量
    private var  audioPlayer: AVAudioPlayer?
    //初始化
   public override init() {
        super.init()
        setPathMusic(name: "")
    }

    //添加本地音乐播放源
   public func setPathMusic(name:String) {
            let path = Bundle.main.path(forResource: name, ofType: "mp3") //保证名字正确并匹配否则会报错
            let pathURL = NSURL(fileURLWithPath: path!)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: pathURL as URL)
                let duration = audioPlayer!.duration
                print("音乐时间\(duration)")
            } catch {
                audioPlayer = nil
            }
        //缓冲音乐
        audioPlayer?.prepareToPlay()
    }

    //开始播放
   public func play() {
        audioPlayer?.play()
    }

    //暂停
   public func pause() {
        audioPlayer?.pause()
    }

    //停止
   public func stop() {
        audioPlayer?.stop()
    }
}
