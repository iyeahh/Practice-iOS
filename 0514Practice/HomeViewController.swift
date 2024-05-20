//
//  HomeViewController.swift
//  0514Practice
//
//  Created by Bora Yang on 5/16/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var plusButton: UIButton!

    @IBOutlet var randomImageView1: UIImageView!
    @IBOutlet var randomImageView2: UIImageView!
    @IBOutlet var randomImageView3: UIImageView!

    @IBOutlet var imageViewOutletCollection: [UIImageView]!

    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!

    @IBOutlet var badge1: UIImageView!
    @IBOutlet var badge2: UIImageView!
    @IBOutlet var badge3: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        imageViewOutletCollection.forEach { imageView in
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .red
            imageView.layer.cornerRadius = 10
        }

        setupMoviePosterImageViewUI()
        setupPlayButtonUI()
        setupPlusButtonUI()

        randomPosterImage()

        randomBanner1()
        randomBanner2()
        randomBanner3()

        randomBadge()
    }

    func setupMoviePosterImageViewUI() {
        moviePosterImageView.contentMode = .scaleAspectFill
        moviePosterImageView.backgroundColor = .red
        moviePosterImageView.layer.cornerRadius = 10
    }

    func setupPlayButtonUI() {
        playButton.backgroundColor = .white
        playButton.layer.masksToBounds = true
        playButton.layer.cornerRadius = 5
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .black
        playButton.setTitle("재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
    }

    func setupPlusButtonUI() {
        plusButton.backgroundColor = .darkGray
        plusButton.layer.masksToBounds = true
        plusButton.layer.cornerRadius = 5
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .white
        plusButton.setTitle("내가 찜한 리스트", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)
    }

    func newEpisode(label1: UILabel, label2: UILabel) {
        label1.isHidden = false
        label2.isHidden = false

        label1.backgroundColor = .red
        label1.text = "새로운 에피소드"
        label1.textColor = .white
        label1.layer.masksToBounds = true
        label1.layer.cornerRadius = 5
        label1.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label1.textAlignment = .center

        label2.backgroundColor = .white
        label2.text = "지금 시청하기"
        label2.textColor = .black
        label2.layer.masksToBounds = true
        label2.layer.cornerRadius = 5
        label2.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label2.textAlignment = .center
    }

    func newSeries(label1: UILabel, label2: UILabel) {
        label1.isHidden = true
        label2.isHidden = false

        label2.backgroundColor = .red
        label2.text = "새로운 시리즈"
        label2.textColor = .white
        label2.layer.masksToBounds = true
        label2.layer.cornerRadius = 5
        label2.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label2.textAlignment = .center
    }

    func noneBanner(label1: UILabel, label2: UILabel) {
        label1.isHidden = true
        label2.isHidden = true
    }

    func randomBanner1() {
        let num = Int.random(in: 0...5)
        if num == 1 {
            newEpisode(label1: label1, label2: label2)
        } else if num == 2 {
            newSeries(label1: label1, label2: label2)
        } else {
            noneBanner(label1: label1, label2: label2)
        }
    }

    func randomBanner2() {
        let num = Int.random(in: 0...5)
        if num == 1 {
            newEpisode(label1: label3, label2: label4)
        } else if num == 2 {
            newSeries(label1: label3, label2: label4)
        } else {
            noneBanner(label1: label3, label2: label4)
        }
    }

    func randomBanner3() {
        let num = Int.random(in: 0...5)
        if num == 1 {
            newEpisode(label1: label5, label2: label6)
        } else if num == 2 {
            newSeries(label1: label5, label2: label6)
        } else {
            noneBanner(label1: label5, label2: label6)
        }
    }

    func randomPosterImage() {
        var movies = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]

        let num = Int.random(in: 0...9)
        moviePosterImageView.image = UIImage(named: movies[num])
        movies.remove(at: num)

        let num1 = Int.random(in: 0...8)
        randomImageView1.image = UIImage(named: movies[num1])
        movies.remove(at: num1)

        let num2 = Int.random(in: 0...7)
        randomImageView2.image = UIImage(named: movies[num2])
        movies.remove(at: num2)

        let num3 = Int.random(in: 0...6)
        randomImageView3.image = UIImage(named: movies[num3])
        movies.remove(at: num3)
    }

    func randomBadge() {
        var num1 = Int.random(in: 0...1)
        var num2 = Int.random(in: 0...1)
        var num3 = Int.random(in: 0...1)

        if num1 == 0 {
            badge1.image = UIImage(named: "top10 badge")
        } else {
            badge1.isHidden = true
        }

        if num1 == 0 {
            badge2.image = UIImage(named: "top10 badge")
        } else {
            badge2.isHidden = true
        }

        if num1 == 0 {
            badge3.image = UIImage(named: "top10 badge")
        } else {
            badge3.isHidden = true
        }
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        randomPosterImage()

        randomBanner1()
        randomBanner2()
        randomBanner3()

        randomBadge()
    }
}
