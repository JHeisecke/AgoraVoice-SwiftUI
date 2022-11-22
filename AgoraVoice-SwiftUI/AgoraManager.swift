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
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "7df51912bf414fae99ee597c8ace5d06", delegate: agoraDelegate)
    }
    
    func joinChannel(token: String = "007eJxTYNDS5lh8rMzX33qr2aQbE5PvB4sp3l47XblPTerYOtmHXo0KDOYpaaaGloZGSWkmhiZpiamWlqmpppbmyRaJyammKQZmjVdqkhsCGRlWtxWyMDJAIIjPzlCSWlySmZfOwAAAQ5sgDg==", channelId: String = "testing") {
        
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
