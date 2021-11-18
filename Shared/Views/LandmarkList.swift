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
        NavigationLink(destination: LandMarkDetail(landmark: landmark)) {
          LandmarkRow(landmark: landmark)
        }
      }
      .navigationTitle("Landmarks")
    }//: Navigation
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
      LandmarkList()
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
