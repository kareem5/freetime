//
//  Section.swift
//  ExpandingCollapsingTest
//
//  Created by Kareem Mohammed on 7/30/17.
//  Copyright © 2017 kareem. All rights reserved.
//

import Foundation

struct Section {
    var genre: String!
    var movies: [String]!
    var expanded: Bool!
    var subtitle: String!
    
    init(genre: String, movies: [String], expanded: Bool, subtitle: String) {
        self.genre = genre
        self.movies = movies
        self.expanded = expanded
        self.subtitle = subtitle
    }
    
}
