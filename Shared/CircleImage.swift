//
//  CircleImage.swift
//  Landmarks
//
//  Created by Arthur Neves on 18/11/21.
//

import SwiftUI

struct CircleImage: View {
  var body: some View {
    Image("turtlerock")
//      .resizable()
//      .scaledToFit()
      .clipShape(Circle())
      .overlay {
        Circle().stroke(.white, lineWidth: 4)
      }
      .shadow(radius: 7)
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
