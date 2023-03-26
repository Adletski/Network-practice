//
//  AppDelegate.swift
//  Networking
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var bgSessionCompletionHandler: (() -> ())?

    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        bgSessionCompletionHandler = completionHandler
    }

}

