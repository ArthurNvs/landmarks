//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Arthur Neves on 18/11/21.
//

import SwiftUI

struct LandmarkList: View {
  
  var body: some View {
    NavigationView {
      List (landmarks) { landmark in
        NavigationLink(destination: LandMarkDetailView()) {
          LandmarkRow(landmark: landmark)
        }
      }
      .navigationTitle("Landmarks")
    }//: Navigation
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
  }
}
