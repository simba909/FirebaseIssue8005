//
//  AppDelegate.swift
//  FirebaseIssue8005
//
//  Created by Simon Jarbrant on 2021-06-03.
//

import FirebaseCore
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
