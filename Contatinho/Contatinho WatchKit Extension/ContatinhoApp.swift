//
//  ContatinhoApp.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import SwiftUI

@main
struct ContatinhoApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                OnboardingView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
