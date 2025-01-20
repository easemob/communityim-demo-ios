//
//  CustomMessageListViewModel.swift
//  EaseChatDemo
//
//  Created by lpe234 on 2025/1/14.
//

import EaseChatUIKit

class MineMessageListViewModel: MessageListViewModel {
    
    override func messageAvatarLongPressed(profile: any ChatUserProfileProtocol) {
        if (self.chatType == .group) {
            if (profile.id != ChatUIKitContext.shared?.currentUserId) {
                self.driver?.addMentionUserToField(user: profile)
            } else {
                consoleLogInfo("LongPress Youself Avatar", type: .debug)
            }
        }
    }
}
