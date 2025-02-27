//
//  Job_InApp.swift
//  Job-In
//
//  Created by Fatih Kenarda on 19.02.2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      print("Firebase....")
      FirebaseApp.configure()

    return true
  }
}

@main
struct Job_InApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
