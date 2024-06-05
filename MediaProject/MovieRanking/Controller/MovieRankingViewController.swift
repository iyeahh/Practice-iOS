//
//  MovieRankingViewController.swift
//  MediaProject
//
//  Created by Bora Yang on 6/5/24.
//

import UIKit
import SnapKit

class MovieRankingViewController: UIViewController {
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.textColor = .white
        textField.text = "20200401"
        return textField
    }()

    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureTableView()
        configureUI()
    }

    private func configureHierachy() {
        view.addSubview(searchButton)
        view.addSubview(barView)
        view.addSubview(dateTextField)
        view.addSubview(movieTableView)
    }

    private func configureLayout() {
        searchButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(80)
            make.height.equalTo(60)
        }

        barView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(searchButton).inset(20)
            make.bottom.equalTo(searchButton.snp.bottom)
            make.height.equalTo(3)
        }

        dateTextField.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(searchButton).inset(10)
            make.bottom.equalTo(barView.snp.top).inset(5)
        }

        movieTableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(barView.snp.bottom).offset(10)
        }
    }

    private func configureTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        movieTableView.rowHeight = 60
    }

    private func configureUI() {
        view.backgroundColor = .black
    }
}

extension MovieRankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.rankingLabel.text = "1"
        cell.movieTitleLable.text = "dddddd"
        cell.dateLabel.text = "dkdkdk"
        return cell
    }
}
