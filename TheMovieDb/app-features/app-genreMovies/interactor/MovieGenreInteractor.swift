//
//  MovieGenreInteractor.swift
//  TheMovieDb
//
//  Created by Phincon on 9/30/22.
//

import Foundation
import Alamofire

class MovieGenreInteractor: PresenterToInteractorMovieGenresProtocol{
    
    var presenter: InteractorToPresenterMovieGenresProtocol?
    
    func fetchListGenres() {
        
        let jsonString: [String: Any] = ["api_key": api_key,
                                         "language": "en-US"]
        
        Alamofire.request(base_url + api_list_genres_movie, method: .get, parameters: jsonString, encoding: URLEncoding.default).responseJSON { response in
            
            if(response.response?.statusCode == 200) {
                if let json = response.result.value as? [String: Any] {
                    let genreData = GenreMovieModel(json)
                    self.presenter?.genreMovieFetchedSuccess(genreList: genreData)
                }
            } else {
                self.presenter?.genreMovieFetchFailed()
            }
        }
        
    }
}
