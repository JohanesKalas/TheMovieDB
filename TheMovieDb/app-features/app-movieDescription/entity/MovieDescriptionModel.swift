//
//  MovieDescriptionModel.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import Foundation

struct MovieDescriptionModel {
    var adult: Bool?
    var genres: GenreMovie?
    var id: Int?
    var originalTitle: String?
    var overview: String?
    var popularity: Int?
    var productionCompany: [MovieCompany] = []
}

struct MovieCompany {
    var name: String?
    var id: Int?
    var logoPath: String?
    var originCountry: String?
}
