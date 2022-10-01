//
//  GenreModel.swift
//  TheMovieDb
//
//  Created by Phincon on 9/30/22.
//

import Foundation

struct GenreMovieModel {
    var genres: [GenreMovie] = []
    
    init(_ dict: [String: Any]) {
        let _ = (dict["genres"] as? [[String: Any]] ?? []).map({(x) -> [String: Any] in
            self.genres.append(.init(x))
            return x
        })
    }
}

struct GenreMovie {
    var id: Int
    var name: String
    
    init(_ dict: [String: Any]) {
        self.id = dict["id"] as? Int ?? 0
        self.name = dict["name"] as? String ?? ""
    }
}
