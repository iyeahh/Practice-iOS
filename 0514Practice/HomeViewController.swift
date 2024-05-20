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

    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!

    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!




    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        moviePosterImageView.contentMode = .scaleAspectFill
        moviePosterImageView.backgroundColor = .red
        moviePosterImageView.layer.cornerRadius = 10

        randomImageView1.contentMode = .scaleAspectFill
        randomImageView1.backgroundColor = .red
        randomImageView1.layer.cornerRadius = 10

        randomImageView2.contentMode = .scaleAspectFill
        randomImageView2.backgroundColor = .red
        randomImageView2.layer.cornerRadius = 10

        randomImageView3.contentMode = .scaleAspectFill
        randomImageView3.backgroundColor = .red
        randomImageView3.layer.cornerRadius = 10

        randomPosterImage()

        playButton.backgroundColor = .white
        playButton.layer.masksToBounds = true
        playButton.layer.cornerRadius = 5
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .black
        playButton.setTitle("재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)

        plusButton.backgroundColor = .darkGray
        plusButton.layer.masksToBounds = true
        plusButton.layer.cornerRadius = 5
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .white
        plusButton.setTitle("내가 찜한 리스트", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)

        randomBanner1()
        randomBanner2()
        randomBanner3()
    }

    func randomBanner1() {
        let num = Int.random(in: 0...5)
        if num == 1 {
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
        } else if num == 2 {
            label1.isHidden = true
            label2.isHidden = false
            label2.backgroundColor = .red
            label2.text = "새로운 시리즈"
            label2.textColor = .white
            label2.layer.masksToBounds = true
            label2.layer.cornerRadius = 5
            label2.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label2.textAlignment = .center
        } else {
            label1.isHidden = true
            label2.isHidden = true
        }
    }

    func randomBanner2() {
        let num = Int.random(in: 0...5)
        if num == 1 {
            label3.isHidden = false
            label4.isHidden = false
            label3.backgroundColor = .red
            label3.text = "새로운 에피소드"
            label3.textColor = .white
            label3.layer.masksToBounds = true
            label3.layer.cornerRadius = 5
            label3.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label3.textAlignment = .center

            label4.backgroundColor = .white
            label4.text = "지금 시청하기"
            label4.textColor = .black
            label4.layer.masksToBounds = true
            label4.layer.cornerRadius = 5
            label4.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label4.textAlignment = .center
        } else if num == 2 {
            label3.isHidden = true
            label4.isHidden = false
            label4.backgroundColor = .red
            label4.text = "새로운 시리즈"
            label4.textColor = .white
            label4.layer.masksToBounds = true
            label4.layer.cornerRadius = 5
            label4.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label4.textAlignment = .center
        } else {
            label3.isHidden = true
            label4.isHidden = true
        }
    }

    func randomBanner3() {
        let num = Int.random(in: 0...5)
        if num == 1 {
            label5.isHidden = false
            label6.isHidden = false
            label5.backgroundColor = .red
            label5.text = "새로운 에피소드"
            label5.textColor = .white
            label5.layer.masksToBounds = true
            label5.layer.cornerRadius = 5
            label5.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label5.textAlignment = .center

            label6.backgroundColor = .white
            label6.text = "지금 시청하기"
            label6.textColor = .black
            label6.layer.masksToBounds = true
            label6.layer.cornerRadius = 5
            label6.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label6.textAlignment = .center
        } else if num == 2 {
            label5.isHidden = true
            label6.isHidden = false
            label6.backgroundColor = .red
            label6.text = "새로운 시리즈"
            label6.textColor = .white
            label6.layer.masksToBounds = true
            label6.layer.cornerRadius = 5
            label6.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            label6.textAlignment = .center
        } else {
            label5.isHidden = true
            label6.isHidden = true
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


    @IBAction func playButtonTapped(_ sender: UIButton) {
        randomPosterImage()

        randomBanner1()
        randomBanner2()
        randomBanner3()
    }
    
}
