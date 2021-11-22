//
//  LandmarksApp.swift
//  Shared
//
//  Created by Arthur Neves on 17/11/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @StateObject private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
    }
  }
}
