//
//  MovieViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/10/24.
//

import UIKit
import SnapKit

class MovieViewController: UIViewController {
    var viewModel = MovieViewModel()

    var movieList: [Movies] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    let tableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHeierarchy()
        configureLayout()
        configureTableView()
        viewModel.callMovieRequest()
        viewModel.dataHandler = { movies in
            self.movieList = movies
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.rowHeight = view.frame.height * 0.6
    }

    private func configureUI() {
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "list.triangle"), style: .plain, target: self, action: nil)
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
        view.backgroundColor = .white
    }

    private func configureHeierarchy() {
        view.addSubview(tableView)
    }

    private func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieContentTableViewCell.self, forCellReuseIdentifier: MovieContentTableViewCell.identifier)
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieContentTableViewCell.identifier, for: indexPath) as? MovieContentTableViewCell else {
            return UITableViewCell()
        }
        let data = movieList[indexPath.row]
        cell.callBackMehtod = {
            let vc = MovieDetailViewController()
            let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            backBarButtonItem.tintColor = .black
            self.navigationItem.backBarButtonItem = backBarButtonItem
            self.navigationController?.pushViewController(vc, animated: true)
        }
        cell.configureData(data)
        return cell
    }
}
