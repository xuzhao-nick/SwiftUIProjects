//
//  SceneDelegate.swift
//  TaskList
//
//  Created by Nick Xu on 24/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            // Create the SwiftUI view that provides the window contents.
            let contentView = ContentView(taskStore: TaskStore())

            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }




}

