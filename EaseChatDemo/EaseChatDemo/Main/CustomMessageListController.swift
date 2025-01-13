//
//  CustomMessageListController.swift
//  EaseChatDemo
//
//  Created by lpe234 on 2025/1/13.
//

import EaseChatUIKit

class CustomMessageListController: MessageListController {
    override func handleAttachmentAction(item: any ActionSheetItemProtocol) {
        switch item.tag {
        case "Camera":
            CameraPermissionManager.shared.checkCameraPermission(from: self) {
                self.openCamera()
            }
        default:
            break
        }
    }
}
