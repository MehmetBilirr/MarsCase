//
//  CornerImage.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

struct CornerImage: View {
    let imageName:String
    let frame:CGFloat
    var body: some View {
        Image(imageName).resizable().frame(width: frame,height: frame,alignment: .center).cornerRadius(frame / 2)
    }
}

struct CornerImage_Previews: PreviewProvider {
    static var previews: some View {
        CornerImage(imageName: "tc", frame: 20)
    }
}
