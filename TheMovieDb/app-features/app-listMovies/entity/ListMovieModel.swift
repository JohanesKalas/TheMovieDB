//
//  ListMovieModel.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import Foundation

struct ListMovieModel {
    var id: String?
    var page: Int?
    var results: [ListMovie] = []
    
    init(_ dict: [String: Any]) {
        self.id = dict["id"] as? String ?? ""
        self.page = dict["page"] as? Int ?? 0
        let _ = (dict["results"] as? [[String: Any]] ?? []).map({(x) -> [String: Any] in
            self.results.append(.init(x))
            return x
        })
    }
}

struct ListMovie {
    var description: String?
    var favouriteCount: Int?
    var id: String?
    var itemCount: Int?
    var iso6391: String?
    var listType: String?
    var name: String?
    var posterPath: String?
    
    init(_ dict: [String: Any]) {
        self.description = dict["description"] as? String ?? ""
        self.favouriteCount = dict["favouriteCount"] as? Int ?? 0
        self.id = dict["id"] as? String ?? ""
        self.itemCount = dict["itemCount"] as? Int ?? 0
        self.iso6391 = dict["iso6391"] as? String ?? ""
        self.listType = dict["listType"] as? String ?? ""
        self.name = dict["name"] as? String ?? ""
        self.posterPath = dict["posterPath"] as? String ?? ""
    }
}
