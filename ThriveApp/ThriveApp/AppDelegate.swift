//
//  AppDelegate.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 1/31/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//
import UIKit
import Firebase
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

