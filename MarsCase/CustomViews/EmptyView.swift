//
//  EmptyView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
      VStack {
        Image("sad").resizable().frame(width: 100, height: 100).padding()
        Text("empty_message").padding()
      }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}


