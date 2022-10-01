//
//  ListMoviePresenter.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import Foundation
import UIKit

class ListMoviePresenter: ViewToPresentListMovieProtocol {
    
    var view: PresenterToListMovieProtocol?
    
    var interactor: PresenterToInteractorListMovieProtocol?
    
    var router: PresenterToRouterListMovieProtocol?
    
    func showListMovieController(navigationController: UINavigationController, idGenre: String) {
        router?.pushToListMovieScreen(navigationController: navigationController, idGenre: idGenre)
    }
    
    func startFetchingListMovie(idGenre: String) {
        interactor?.fetchListMoviesByGenre(idGenre: idGenre)
    }
}

extension ListMoviePresenter: InteractorToPresenterListMovieProtocol {
    func moviesByGenreFetchedSuccess(movieList: ListMovieModel) {
        view?.showMovies(movieList: movieList)
    }
    
    func moviesByGenreFetchFailed() {
        view?.showError()
    }
}
