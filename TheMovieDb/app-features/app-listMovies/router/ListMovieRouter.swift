//
//  ListMovieRouter.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import Foundation
import UIKit

class ListMovieRouter: PresenterToRouterListMovieProtocol {
    static func createModule(idGenre: String) -> ListMovieViewController {
        let view = ListMovieViewController()
        
        let presenter: ViewToPresentListMovieProtocol & InteractorToPresenterListMovieProtocol = ListMoviePresenter()
        let interactor: PresenterToInteractorListMovieProtocol = ListMovieInteracotr()
        let router: PresenterToRouterListMovieProtocol = ListMovieRouter()
        
        view.idGenre = idGenre
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
