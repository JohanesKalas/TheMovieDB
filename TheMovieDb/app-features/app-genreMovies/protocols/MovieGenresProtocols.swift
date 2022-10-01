//
//  MovieGenresProtocols.swift
//  TheMovieDb
//
//  Created by Phincon on 9/30/22.
//

import Foundation
import UIKit

protocol ViewToPresenMovieGenresProtocol: AnyObject {
    
    var view: PresenterToMovieGenresProtocol? {get set}
    var interactor: PresenterToInteractorMovieGenresProtocol? {get set}
    var router: PresenterToRouterMovieGenresProtocol? {get set}
    func startFetchingNotice()
    func showListMovieController(navigationController:UINavigationController, idGenre: String)

}

protocol PresenterToMovieGenresProtocol: AnyObject {
    func showGenres(genreMovie:GenreMovieModel)
    func showError()
}

protocol PresenterToRouterMovieGenresProtocol: AnyObject {
    static func createModule()-> MovieGenresViewController
    func pushToListMovieScreen(navigationController:UINavigationController, idGenre: String)
}

protocol PresenterToInteractorMovieGenresProtocol: AnyObject {
    var presenter:InteractorToPresenterMovieGenresProtocol? {get set}
    func fetchListGenres()
}

protocol InteractorToPresenterMovieGenresProtocol: AnyObject {
    func genreMovieFetchedSuccess(genreList: GenreMovieModel)
    func genreMovieFetchFailed()
}
