//
//  AgoraManager.swift
//  Switch
//
//  Created by Javier Heisecke on 2022-11-21.
//

import Foundation
import AgoraRtcKit

class AgoraManager {
    static let shared = AgoraManager()
    
    private var agoraKit: AgoraRtcEngineKit?
    private var agoraDelegate: AgoraRtcEngineDelegate?
}

extension AgoraManager {
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "appid", delegate: agoraDelegate)
    }
    
    func joinChannel(token: String = "token", channelId: String = "channel") {
        
        agoraKit?.joinChannel(byToken: token, channelId: channelId, info: nil, uid: 0, joinSuccess: {
            (channel, uid, elapsed) in })
    }
    
    func leaveChannel() {
        agoraKit?.leaveChannel(nil)
        destroyInstance()
    }
    
    func mute(value:Bool) {
        agoraKit?.muteLocalAudioStream(value)
    }
    
    private func destroyInstance() {
        AgoraRtcEngineKit.destroy()
    }
}
