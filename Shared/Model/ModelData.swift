//
//  ModelData.swift
//  Landmarks
//
//  Created by Arthur Neves on 18/11/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
  @Published var landmarks: [Landmark] = load("landmarkData.json")
  var hikes: [Hike] = load("hikeData.json")
  
  var features: [Landmark] {
    landmarks.filter { $0.isFeatured }
  }
  
  var categories: [String: [Landmark]] {
    Dictionary(
      grouping: landmarks,
      by: { $0.category.rawValue }
    )
  }
}

func load<T: Decodable>(_ filename: String) -> T {
  let data: Data
  
  // Get file path
  guard let url = Bundle.main.url(forResource: filename, withExtension: nil)
  else {
    fatalError("Failed to find \(filename) in main bundle.")
  }
  
  // Load file data into property
  do {
    data = try Data(contentsOf: url)
  } catch {
    fatalError("Failed to load \(filename) from main bundle:\n\(error)")
  }
  
  // Try to return the decoded data
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Failed to parse \(filename) as \(T.self):\n\(error)")
  }
}
