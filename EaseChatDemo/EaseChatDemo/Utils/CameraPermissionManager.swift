//
//  CameraPermissionManager.swift
//  EaseChatDemo
//
//  Created by lpe234 on 2025/1/13.
//

import AVFoundation
import UIKit

class CameraPermissionManager {
    static let shared = CameraPermissionManager()
    
    private init() {}
    
    func checkCameraPermission(from viewController: UIViewController, ckb: @escaping () -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { response in
                if response {
                    ckb()
                } else {
                    self.showPermissionAlert(from: viewController)
                }
            }
        case .restricted, .denied:
            self.showPermissionAlert(from: viewController)
        case .authorized:
            ckb()
        @unknown default:
            break
        }
    }
    
    func showPermissionAlert(from viewController: UIViewController) {
        // 提示用户去设置页面开启权限
        let alert = UIAlertController(title: "CameraPermissionDisabled".localized(), message: "EnableCameraPermissionInSettings".localized(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "GoToSettings".localized(), style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
