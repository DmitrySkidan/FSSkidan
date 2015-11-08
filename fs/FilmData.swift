//
//  FilmData.swift
//  fs
//
//  Created by Mac on 07.11.15.
//  Copyright © 2015 MyApp. All rights reserved.
//

import Foundation

class FilmData: NSObject {
    
    var filmPageUrl: String!
    var filmPoster: String!
    var filmTitle: String!
    
    init(filmPageUrl: String, filmPoster: String, filmTitle: String) {
        self.filmPageUrl = filmPageUrl
        self.filmPoster = filmPoster
        self.filmTitle = filmTitle
    }
    
}
