//
//  MovieDescriptionProtocol.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import Foundation

protocol ViewToPresentMovieDescriptionProtocol: AnyObject {
    
    var view: PresenterToMovieDescriptionProtocol? {get set}
    var interactor: PresenterToInteractorMovieDescriptionProtocol? {get set}
    var router: PresenterToRouterMovieDescriptionProtocol? {get set}
    func startFetchingMovieDescription(idMovie: String)
    
}

protocol PresenterToMovieDescriptionProtocol: AnyObject {
    func showMovieDescription(movie: MovieDescriptionModel)
    func showError()
}

protocol PresenterToInteractorMovieDescriptionProtocol: AnyObject {
    static func createModule(idGenre: String) -> MovieDescriptionViewController
}

protocol PresenterToRouterMovieDescriptionProtocol: AnyObject {
    var presenter:InteractorToPresenterMovieDescriptionProtocol? {get set}
    func fetchListMovieDescription(idMovie: String)
}

protocol InteractorToPresenterMovieDescriptionProtocol: AnyObject {
    func movieDescriptionFetchedSuccess(movie: MovieDescriptionModel)
    func movieDescriptionFetchFailed()
}
