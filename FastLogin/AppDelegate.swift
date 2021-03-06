//
//  AppDelegate.swift
//  FastLogin
//
//  Created by Suyeol Jeon on 17/03/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let sceneSwitcher = SceneSwitcher(window: self.window)
    sceneSwitcher.loginStoryboard = LoginStoryboard(authService: AuthService.shared, sceneSwitcher: sceneSwitcher)
    sceneSwitcher.profileStoryboard = ProfileStoryboard(userService: UserService.shared, sceneSwitcher: sceneSwitcher)
    sceneSwitcher.presentLogin()
    return true
  }
}
