//
//  OtakuSakuruApp.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 02/02/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      // configuration Firebase
    FirebaseApp.configure()
    return true
  }
}

@main
struct OtakuSakuruApp: App {
        // register app delegate fo Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
