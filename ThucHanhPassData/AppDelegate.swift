//
//  AppDelegate.swift
//  ThucHanhPassData
//
//  Created by Tung on 18/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let inputVC = InputViewController()
        window?.rootViewController = inputVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

