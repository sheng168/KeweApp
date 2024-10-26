//
//  Analytics.swift
//  RateYourCharge
//
//  Created by Jin on 9/18/23.
//

import Foundation
import SwiftUI

import FirebaseAnalytics
import FirebaseCore
import FirebaseInstallations
import FirebaseRemoteConfig

import Then

public enum FirebaseInit {
    static var remoteConfig = RemoteConfig.remoteConfig()
    
    public static func config() {
        FirebaseApp.configure()
        
        // remote config
        let settings = RemoteConfigSettings().then {
            $0.minimumFetchInterval = 0
        }
        
        FirebaseInit.remoteConfig.configSettings = settings
        
        Installations.installations().installationID { (id, error) in
            if let error = error {
                print("Error fetching id: \(error)")
                return
            }
            guard let id = id else { return }
            print("Installation ID: \(id)")
        }
        
        FirebaseInit.remoteConfig.addOnConfigUpdateListener { configUpdate, error in
            guard let configUpdate, error == nil else {
                return print("Error listening for config updates: \(error)")
            }
            
            print("Updated keys: \(configUpdate.updatedKeys)")
            
            FirebaseInit.remoteConfig.activate { changed, error in
                guard error == nil else { return print(error) }
                let label: String? = remoteConfig.configValue(forKey: "buy").stringValue
                print(label)
//                DispatchQueue.main.async {
//                    self.displayWelcome()
//                }
            }
        }
        
        Task {
            try await FirebaseInit.remoteConfig.fetchAndActivate()
//            Config.shared.loadConfig()
        }
    }
}
