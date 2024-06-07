//
//  ChoiceViewController.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit

class ChoiceViewController: UIViewController {
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureCollectionView()
    }

    private func configureHierarchy() {
        view.addSubview(collectionView)
    }

    private func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

    private func configureUI() {
        navigationItem.title = "다마고치 선택하기"
        view.backgroundColor = .primary
    }

    private func configureCollectionView() {
        collectionView.register(TamagochiCollectionViewCell.self, forCellWithReuseIdentifier: TamagochiCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ChoiceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TamagochiCollectionViewCell.identifier,
            for: indexPath
        ) as? TamagochiCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.setData(indexPath.row)
        return cell
    }
}

extension ChoiceViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 50) / 3
        return CGSize(width: width, height: width + 30)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_CVC: UIViewControllerRepresentable {

func updateUIViewController(_ uiView: UIViewController,context: Context) {
    // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    ChoiceViewController()
  }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_CVC_PreviewProvider: PreviewProvider {
  static var previews: some View {
    Group {
      ViewControllerRepresentable_CVC()
        .ignoresSafeArea()
        .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
    }

  }
} #endif
