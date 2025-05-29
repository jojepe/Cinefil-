//
//  MovieModel.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import SwiftUI
import Foundation

struct Movie: Identifiable {
    var id = UUID()
    
    var poster: String
    var title: String
    var year: String
    var synopsis: String
    var director: String
    var writers: String
    
    var isFavorite: Bool = false
    var isWatched: Bool = false
    
    //@Binding var rating: Int
    var maximumRating = 5
    
}
