//
//  ScaleText.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 20.07.2023.
//

import SwiftUI

struct ScaleText: View {
  let text:String
    var body: some View {
      Text(text).scaledToFit().minimumScaleFactor(0.1)
    }
}

struct ScaleText_Previews: PreviewProvider {
    static var previews: some View {
        ScaleText(text: "adasdasasıjh")
    }
}
