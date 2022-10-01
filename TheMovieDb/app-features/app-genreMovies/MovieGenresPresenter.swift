//
//  MovieGenresPresenter.swift
//  TheMovieDb
//
//  Created by Phincon on 9/30/22.
//

import Foundation
import UIKit

class MovieGenrePresenter: ViewToPresenMovieGenresProtocol {
    
    var view: PresenterToMovieGenresProtocol?
    
    var interactor: PresenterToInteractorMovieGenresProtocol?
    
    var router: PresenterToRouterMovieGenresProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchListGenres()
    }
    
    func showListMovieController(navigationController: UINavigationController, idGenre: String) {
        router?.pushToListMovieScreen(navigationController: navigationController, idGenre: idGenre)
    }
}

extension MovieGenrePresenter: InteractorToPresenterMovieGenresProtocol {
    func genreMovieFetchedSuccess(genreList: GenreMovieModel) {
        view?.showGenres(genreMovie: genreList)
    }
    
    func genreMovieFetchFailed() {
        view?.showError()
    }
}


