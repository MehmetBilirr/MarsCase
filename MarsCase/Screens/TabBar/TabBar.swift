//
//  TabBar.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("home", systemImage: "house")
                }

            PastView()
                .tabItem {
                    Label("past", systemImage: "clock.arrow.circlepath")
                }
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            
    }
}
