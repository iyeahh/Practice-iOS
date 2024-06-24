//
//  SearchRootView.swift
//  Movie
//
//  Created by Bora Yang on 6/24/24.
//

import UIKit
import SnapKit

protocol SearchRootViewDelegate {
    func searchButtonTapped(text: String)
}

final class SearchRootView: UIView {
    private let searchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "영화 정보를 찾아드려요"
        return searchBar
    }()

    var searchRootViewDelegate: SearchRootViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        searchBar.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchRootView {
    private func configureHierarchy() {
        addSubview(searchBar)
    }

    private func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(safeAreaLayoutGuide).inset(30)
        }
    }
}

extension SearchRootView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        searchRootViewDelegate?.searchButtonTapped(text: text)
    }
}
