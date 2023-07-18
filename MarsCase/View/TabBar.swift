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
                    Label("Anasayfa", systemImage: "house")
                }

            PastView()
                .tabItem {
                    Label("Geçmiş İşlemler", systemImage: "clock.arrow.circlepath")
                }
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            
    }
}
