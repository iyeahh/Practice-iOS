//
//  ChoiceViewController.swift
//  Tamagochi
//
//  Created by Bora Yang on 6/7/24.
//

import UIKit

class ChoiceViewController: UIViewController {
    let tamagochiList = TamagochiList()
    var status: Status

    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()

    init(status: Status) {
        self.status = status
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureNavi()
        configureCollectionView()
    }

    private func configureHierarchy() {
        view.addSubview(collectionView)
    }

    private func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

    private func configureUI() {
        view.backgroundColor = .primary
    }

    private func configureNavi() {
        navigationItem.title = status.navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.secondary]
    }

    private func configureCollectionView() {
        collectionView.register(TamagochiCollectionViewCell.self, forCellWithReuseIdentifier: TamagochiCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ChoiceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagochiList.list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TamagochiCollectionViewCell.identifier,
            for: indexPath
        ) as? TamagochiCollectionViewCell else {
            return UICollectionViewCell()
        }

        let data = tamagochiList.list[indexPath.row]

        cell.setData(data)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tamagochi = tamagochiList.list[indexPath.row]
        let detailVC = DetailViewController(tamagochi: tamagochi, status: status)
        detailVC.modalPresentationStyle = .overFullScreen
        present(detailVC, animated: true)
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
