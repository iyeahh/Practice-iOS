//
//  MovieDetailViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/12/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    var movie: Movies
    var isSelected: Bool = false

    let backgroundImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let movieNameLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "dddd"
        return label
    }()

    let posterImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let tableView = {
        let tableView = UITableView()
        return tableView
    }()

    init(movie: Movies) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

        backgroundImageView.kf.setImage(with: movie.backImageUrl) { result in
            switch result {
            case .success:
                self.view.setNeedsLayout()
                self.view.layoutIfNeeded()
            case .failure(let error):
                print("Failed to load image: \(error)")
            }
        }
        movieNameLabel.text = movie.title
        posterImageView.kf.setImage(with: movie.imageUrl) { result in
            switch result {
            case .success:
                self.view.setNeedsLayout()
                self.view.layoutIfNeeded()
            case .failure(let error):
                print("Failed to load image: \(error)")
            }
        }
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
            make.height.equalTo(250)
        }

        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView).inset(10)
            make.leading.equalToSuperview().inset(30)
            make.height.equalTo(30)
        }

        posterImageView.snp.makeConstraints { make in
            make.leading.equalTo(backgroundImageView.snp.leading).inset(30)
            make.top.equalTo(movieNameLabel.snp.bottom).offset(10)
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
            cell.setData(movie.overView)
//            cell.callBackMehtod = { response in
//                if response {
//                    cell.descriptionLabel.numberOfLines = 2
//                }
//                else{
//                    cell.descriptionLabel.numberOfLines = 0
//                }
//            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CastingTableViewCell.identifier,
                for: indexPath
            ) as? CastingTableViewCell else {
                return UITableViewCell()
            }
            let data = movie.actor[indexPath.row]
            cell.setData(data)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 100
    }
}
