//
//  MarsCaseApp.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

@main
struct MarsCaseApp: App {
    let migrator = RealmManager()
    var body: some Scene {
        WindowGroup {
          let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
          let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            TabBarView()
                
        }
    }
}
