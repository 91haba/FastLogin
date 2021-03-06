//
//  ProfileViewController.swift
//  FastLogin
//
//  Created by Suyeol Jeon on 18/03/2018.
//  Copyright © 2018 Suyeol Jeon. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
  @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet var welcomeLabel: UILabel!
  @IBOutlet var logoutButton: UIButton!

  var userService: UserServiceType?
  var sceneSwitcher: SceneSwitcherType?

  override func viewDidLoad() {
    super.viewDidLoad()

    self.activityIndicatorView.isHidden = false
    self.welcomeLabel.isHidden = true
    self.logoutButton.isHidden = true

    self.userService?.currentUser { result in
      self.activityIndicatorView.isHidden = true
      self.welcomeLabel.isHidden = false
      self.logoutButton.isHidden = false

      switch result {
      case let .success(username):
        self.welcomeLabel.text = "Welcome, \(username)!"

      case .failure:
        self.welcomeLabel.text = "Error!"
      }
    }
  }

  @IBAction private func logout() {
    self.sceneSwitcher?.presentLogin()
  }
}

struct ProfileStoryboard {
  let userService: UserServiceType
  let sceneSwitcher: SceneSwitcherType

  func initialViewController() -> UIViewController? {
    let storyboard = UIStoryboard(name: "Profile", bundle: nil)
    let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
    let profileViewController = navigationController?.topViewController as? ProfileViewController
    profileViewController?.userService = self.userService
    profileViewController?.sceneSwitcher = self.sceneSwitcher
    return navigationController
  }
}
