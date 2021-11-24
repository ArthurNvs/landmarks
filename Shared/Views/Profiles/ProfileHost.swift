//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Arthur Neves on 24/11/21.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var editMode
  @EnvironmentObject var modelData: ModelData
  @State private var draftProfile = Profile.default
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        if editMode?.wrappedValue == .active {
          Button("Cancel", role: .cancel) {
            draftProfile = modelData.profile
            editMode?.animation().wrappedValue = .inactive
          }
        }
        Spacer()
        EditButton()
      } //: HStack
      
      if editMode?.wrappedValue == .inactive {
        ProfileSummary(profile: modelData.profile)
      } else {
        ProfileEditor(profile: $draftProfile)
          .onAppear {
            draftProfile = modelData.profile
          }
          .onDisappear {
            modelData.profile = draftProfile
          }
      }
    }
    .padding()
  }
}

// Even though this view doesn’t use a property with the @EnvironmentObject attribute,
// ProfileSummary, a child of this view, does.
// So without the modifier, the preview fails.
struct ProfileHost_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHost()
      .environmentObject(ModelData())
  }
}
