//
//  MainView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewModel()
    @State var showingPopup = false
    @State var amount : Double = 2315.91
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    CurrentAmountView(amount: amount).padding(.top)
                    Spacer()
                    
                    List {
                      ForEach(mainViewModel.currencies) { item in
                            CurrencyList(currency: item)
                        }
                    
                    }
                    
                    Button {

                    } label: {
                        Label("Satın Al", systemImage: "plus").frame(maxWidth: .infinity)
                    }.buttonStyle(.borderedProminent).tint(.black).buttonStyle(.borderedProminent)
                        .controlSize(.large).padding(.leading,8).padding(.trailing,8)
                    
                    Button {


                    } label: {
                        Label("Geçmiş İşlemler", systemImage: "clock.arrow.circlepath").frame(maxWidth: .infinity)
                    }.buttonStyle(.borderedProminent).tint(.black).buttonStyle(.borderedProminent)
                        .controlSize(.large).padding(.leading,8).padding(.trailing,8)
                }.padding(.bottom,20)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
