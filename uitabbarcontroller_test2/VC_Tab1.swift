//
//  VC_Tab1.swift
//  uitabbarcontroller_test2
//
//  Created by Hyeon Jong Kim on 12/12/24.
//

import UIKit

enum CallType {
    case without_async
    case with_async
    case with_async_01
}

class VC_Tab1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onWithoutAsync() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "VC_Tab1_Child") as? VC_Tab1_Child {
            vc.callType = .without_async
            self.navigationController?.pushViewController(vc, animated: true)
                        
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.pop_without_async()
            }
        }
    }
    
    @IBAction func onAsync() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "VC_Tab1_Child") as? VC_Tab1_Child {
            vc.callType = .with_async
            self.navigationController?.pushViewController(vc, animated: true)
                        
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.pop_with_async()
            }
        }
    }
    
    @IBAction func onAsync01() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "VC_Tab1_Child") as? VC_Tab1_Child {
            vc.callType = .with_async_01
            self.navigationController?.pushViewController(vc, animated: true)
                        
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.pop_with_async_01()
            }
        }
    }
    
    private func pop_without_async() {
        guard let tabBarController = getActiveSceneRootViewController() as? UITabBarController else { return }
        
        self.navigationController?.popToRootViewController(animated: false)
        
        tabBarController.selectedIndex = 1
    }
    
    private func pop_with_async() {
        guard let tabBarController = getActiveSceneRootViewController() as? UITabBarController else { return }
                
        self.navigationController?.popToRootViewController(animated: false)
        
        DispatchQueue.main.async {
            tabBarController.selectedIndex = 1
        }
    }
    
    private func pop_with_async_01() {
        guard let tabBarController = getActiveSceneRootViewController() as? UITabBarController else { return }
        
        self.navigationController?.popToRootViewController(animated: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            tabBarController.selectedIndex = 1
        }
    }
    
    private func getActiveSceneRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .first as? UIWindowScene else {
            return nil
        }

        guard let rootViewController = windowScene.windows
                .filter({ $0.isKeyWindow }).first?.rootViewController else {
            return nil
        }
        
        return rootViewController
    }
}
