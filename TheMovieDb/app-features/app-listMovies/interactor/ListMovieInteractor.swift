//
//  ListMovieInteractor.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import Foundation
import Alamofire

class ListMovieInteracotr: PresenterToInteractorListMovieProtocol {
    var presenter: InteractorToPresenterListMovieProtocol?
    
    func fetchListMoviesByGenre(idGenre: String) {
        let jsonString: [String: Any] = ["api_key": api_key,
                                         "language": "en-US"]
        
        Alamofire.request(base_url + "movie/\(idGenre)/lists", method: .get, parameters: jsonString, encoding: URLEncoding.default).responseJSON { response in
            
            if(response.response?.statusCode == 200) {
                if let json = response.result.value as? [String: Any] {
                    let listMovieData = ListMovieModel(json)
                    self.presenter?.moviesByGenreFetchedSuccess(movieList: listMovieData)
                }
            } else {
                self.presenter?.moviesByGenreFetchFailed()
            }
        }
    }
}
