//
//  ListMoviesProtocol.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import Foundation
import UIKit

protocol ViewToPresentListMovieProtocol: AnyObject {
    
    var view: PresenterToListMovieProtocol? {get set}
    var interactor: PresenterToInteractorListMovieProtocol? {get set}
    var router: PresenterToRouterListMovieProtocol? {get set}
    func startFetchingListMovie(idGenre: String)
    func showListMovieController(navigationController: UINavigationController, idGenre: String)

}

protocol PresenterToListMovieProtocol: AnyObject {
    func showMovies(movieList: ListMovieModel)
    func showError()
}

protocol PresenterToRouterListMovieProtocol: AnyObject {
    static func createModule(idGenre: String) -> ListMovieViewController
    func pushToListMovieScreen(navigationController: UINavigationController, idGenre: String)
}

protocol PresenterToInteractorListMovieProtocol: AnyObject {
    var presenter:InteractorToPresenterListMovieProtocol? {get set}
    func fetchListMoviesByGenre(idGenre: String)
}

protocol InteractorToPresenterListMovieProtocol: AnyObject {
    func moviesByGenreFetchedSuccess(movieList: ListMovieModel)
    func moviesByGenreFetchFailed()
}

