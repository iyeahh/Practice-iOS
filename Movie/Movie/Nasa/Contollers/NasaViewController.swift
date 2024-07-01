//
//  NasaViewController.swift
//  Movie
//
//  Created by Bora Yang on 7/1/24.
//

import UIKit

final class NasaViewController: UIViewController {
    private let rootView = NasaRootView()

    private var total: Double = 0
    private var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total
            let convertedResult = floor(result * 100)
            rootView.progressLabel.text = "\(convertedResult) / 100"
        }
    }

    private var session: URLSession!

    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
    }
}

extension NasaViewController: NasaRootViewDelegate {
    func requestButtonTapped() {
        buffer = Data()
        callRequest()
    }

    private func callRequest() {
        let request = URLRequest(url: Nasa.photo)
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: request).resume()
    }
}

extension NasaViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        if let response = response as? HTTPURLResponse,
           (200...299).contains(response.statusCode) {
            let contentLength = response.value(forHTTPHeaderField: "Content-Length")!
            total = Double(contentLength)!
            return .allow
        } else {
            return .cancel
        }
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer?.append(data)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            rootView.progressLabel.text = "문제가 발생했습니다"
            rootView.mainImageView.image = UIImage(systemName: "star")
        } else {
            print("성공")

            guard let buffer = buffer else {
                print("Buffer nil")
                return
            }

            let image = UIImage(data: buffer)
            rootView.mainImageView.image = image
        }
    }
}
