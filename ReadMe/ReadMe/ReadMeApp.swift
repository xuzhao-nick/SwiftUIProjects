//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by Nick Xu on 4/11/20.
//

import SwiftUI

@main
struct ReadMeApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(Library())
    }
  }
}
