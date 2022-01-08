//
//  HumanApp.swift
//  Human for Watch WatchKit Extension
//
//  Created by Raj Thimmiah on 9/22/21.
//

import SwiftUI

@main
struct HumanApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        }
    }

