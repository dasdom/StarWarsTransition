//
//  AppDelegate.swift
//  StarWarsTransitioning
//
//  Created by dasdom on 14.01.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)
  let navigationControllerDelegate = NavigationControllerDelegate()
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let firstViewController = FirstViewController()
    let navigationController = UINavigationController(rootViewController: firstViewController)
    navigationController.delegate = navigationControllerDelegate
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    return true
  }
  
}

