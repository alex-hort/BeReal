//
//  BeRealApp.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 28/11/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        // CRÍTICO: Deshabilitar verificación de app para desarrollo/testing
#if DEBUG
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
#endif
        
        return true
    }
    
    // Maneja el URL callback de reCAPTCHA
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if Auth.auth().canHandle(url) {
            return true
        }
        return false
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if Auth.auth().canHandleNotification(userInfo) {
            completionHandler(.noData)
            return
        }
        
        completionHandler(.noData)
    }
}

@main
struct BeRealApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(AuthenticationVM.shared)
        }
    }
}
