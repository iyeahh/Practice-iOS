//
//  MovieDetailViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/12/24.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    let backgroundImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let movieNameLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    let posterImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let tableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHierarchy()
        configureLayout()
        configureTableView()
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "출연/제작"
    }

    private func configureHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(movieNameLabel)
        view.addSubview(posterImageView)
        view.addSubview(tableView)
    }

    private func configureLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }

        movieNameLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(backgroundImageView).inset(30)
            make.height.equalTo(40)
        }

        posterImageView.snp.makeConstraints { make in
            make.leading.equalTo(backgroundImageView).inset(30)
            make.top.equalTo(movieNameLabel.snp.bottom).offset(20)
            make.bottom.equalTo(backgroundImageView.snp.bottom).inset(10)
            make.width.equalTo(posterImageView.snp.height).multipliedBy(0.8)
        }

        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(backgroundImageView.snp.bottom)
        }
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(MovieDescriptionTableViewCell.self, forCellReuseIdentifier: MovieDescriptionTableViewCell.identifier)
        tableView.register(CastingTableViewCell.self, forCellReuseIdentifier: CastingTableViewCell.identifier)
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "OverView"
        } else {
            return "Cast"
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MovieDescriptionTableViewCell.identifier,
                for: indexPath
            ) as? MovieDescriptionTableViewCell else {
                return UITableViewCell()
            } 
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CastingTableViewCell.identifier,
                for: indexPath
            ) as? CastingTableViewCell else {
                return UITableViewCell()
            } 
            return cell
        }
    }
}
