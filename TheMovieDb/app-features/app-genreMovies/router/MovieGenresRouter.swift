//
//  MovieGenresRouter.swift
//  TheMovieDb
//
//  Created by Phincon on 9/30/22.
//

import Foundation
import UIKit

class MovieGenresRouter: PresenterToRouterMovieGenresProtocol {
    
    
    static func createModule() -> MovieGenresViewController {
        let view = MovieGenresViewController()
        
        let presenter: ViewToPresenMovieGenresProtocol & InteractorToPresenterMovieGenresProtocol = MovieGenrePresenter()
        let interactor: PresenterToInteractorMovieGenresProtocol = MovieGenreInteractor()
        let router: PresenterToRouterMovieGenresProtocol = MovieGenresRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToListMovieScreen(navigationController: UINavigationController, idGenre: String) {
        let module = ListMovieRouter.createModule(idGenre: idGenre)
        navigationController.pushViewController(module, animated: true)
    }
}
