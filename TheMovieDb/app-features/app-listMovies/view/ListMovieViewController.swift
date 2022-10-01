//
//  ListMovieViewController.swift
//  TheMovieDb
//
//  Created by Phincon on 10/1/22.
//

import UIKit

class ListMovieViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var presentor: ViewToPresentListMovieProtocol?
    var listMovie: ListMovieModel?
    var idGenre: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List Movie"
        presentor?.startFetchingListMovie(idGenre: idGenre ?? "")
        
        tableView.delegate = self
        tableView.dataSource = self
//        
        tableView.register(ListMovieTableViewCell.nib(), forCellReuseIdentifier: ListMovieTableViewCell.identifier())
    }
}

extension ListMovieViewController: PresenterToListMovieProtocol {
    func showMovies(movieList: ListMovieModel) {
        self.listMovie = movieList
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List Movie", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ListMovieViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovie?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListMovieTableViewCell.identifier(), for: indexPath) as! ListMovieTableViewCell
        
        let movie = listMovie?.results[indexPath.row]
        cell.data = movie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = listMovie?.results[indexPath.row]
    }
}
