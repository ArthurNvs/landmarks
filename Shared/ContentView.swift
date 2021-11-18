//
//  ContentView.swift
//  Shared
//
//  Created by Arthur Neves on 17/11/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      MapView()
        .ignoresSafeArea(edges: .top)
        .frame(height: 300)
      
      CircleImage()
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        Text("Turtle Rock")
          .font(.title)
        
        HStack {
          Text("Joshua Tree National Park")
          Spacer()
          Text("California")
        }//: HStack
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        Divider()
        
        Text("About")
          .font(.title2)
        Text("Description texts inside here")
      } //: HStack
      .padding()
      
      Spacer()
    } //: VStack
  } //: body View
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
