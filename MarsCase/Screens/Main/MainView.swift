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
                  CurrentAmountView(amount: amount).padding()
                    
                    List {
                      ForEach(mainViewModel.currencies) { item in
                            CurrencyList(currency: item)
                        }
                    }.padding()
                    Button {

                    } label: {
                        Label("buy_it", systemImage: "plus").frame(maxWidth: .infinity,maxHeight: 10)
                    }.buttonStyle(.borderedProminent).tint(.black).buttonStyle(.borderedProminent)
                        .controlSize(.large).padding(.leading,20).padding(.trailing,20)
                    
                    Button {


                    } label: {
                        Label("past", systemImage: "clock.arrow.circlepath").frame(maxWidth: .infinity,maxHeight: 10)
                    }.buttonStyle(.borderedProminent).tint(.black).buttonStyle(.borderedProminent)
                        .controlSize(.large).padding(.leading,20).padding(.trailing,20)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
