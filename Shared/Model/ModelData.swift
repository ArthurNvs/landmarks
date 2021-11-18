//
//  ModelData.swift
//  Landmarks
//
//  Created by Arthur Neves on 18/11/21.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

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