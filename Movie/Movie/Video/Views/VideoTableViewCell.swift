//
//  VideoTableViewCell.swift
//  Movie
//
//  Created by Bora Yang on 7/1/24.
//

import UIKit
import WebKit
import SnapKit

final class VideoTableViewCell: BaseTableViewCell {
    static let identifier = "VideoTableViewCell"

    let webView = WKWebView()

    override func configureHierarchy() {
        super.configureHierarchy()
        contentView.addSubview(webView)
    }

    override func configureView() {
        super.configureView()
        titleLabel.text = "영상"
    }

    override func configureLayout() {
        super.configureLayout()
        webView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalToSuperview().inset(10)
        }
    }

    func openWebPage(url: String) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
