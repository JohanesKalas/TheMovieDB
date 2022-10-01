//
//  MovieGenresViewController.swift
//  TheMovieDb
//
//  Created by Phincon on 9/30/22.
//

import UIKit

class MovieGenresViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var presentor: ViewToPresenMovieGenresProtocol?
    var genreMovie: GenreMovieModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List Genre"
        presentor?.startFetchingNotice()
//        showProgressIndicator(view: self.view)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ListGenreTableViewCell.nib(), forCellReuseIdentifier: ListGenreTableViewCell.identifier())
    }
}

extension MovieGenresViewController: PresenterToMovieGenresProtocol {
    func showGenres(genreMovie: GenreMovieModel) {
        self.genreMovie = genreMovie
        self.tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List Genre", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension MovieGenresViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreMovie?.genres.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListGenreTableViewCell.identifier(), for: indexPath) as! ListGenreTableViewCell
        
        let genre = genreMovie?.genres[indexPath.row]
        cell.data = genre
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = genreMovie?.genres[indexPath.row]
        presentor?.showListMovieController(navigationController: navigationController!, idGenre: "\(genre?.id ?? 0)")
    }
}
