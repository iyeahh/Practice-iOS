//
//  ChatViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatTextView: UITextView!
    @IBOutlet var textViewBackgroundView: UIView!
    @IBOutlet var sendButton: UIButton!

    @IBOutlet var textViewConstraint: NSLayoutConstraint!
    @IBOutlet var textViewHeightConstraint: NSLayoutConstraint!

    var chatList: [Chat]?
    var chatroomName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationUI()
        setupTableView()
        registerTableViewCells()
        setupTextViewUI()
        setupButtonUI()
        setupTextViewBackgroundViewUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let tabBar = self.tabBarController?.tabBar else {
            return
        }
        let tabBarHeight = tabBar.frame.size.height

        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        let keyboardHeight = keyboardFrame.size.height

        textViewConstraint.constant = keyboardHeight - tabBarHeight + 20
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        scrollToLastIndexRow()
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        textViewConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        scrollToLastIndexRow()
    }

    private func setupNavigationUI() {
        navigationItem.title = chatroomName
    }

    private func setupTextViewBackgroundViewUI() {
        textViewBackgroundView.backgroundColor = UIColor.secondary.withAlphaComponent(0.3)
        textViewBackgroundView.layer.cornerRadius = 10
    }

    private func setupTextViewUI() {
        chatTextView.text = "메세지를 입력하세요"
        chatTextView.textColor = UIColor.secondary
        chatTextView.backgroundColor = .clear
        chatTextView.isScrollEnabled = false
        chatTextView.delegate = self
    }

    private func setupButtonUI() {
        sendButton.backgroundColor = .clear
        sendButton.setImage(UIImage(systemName: "arrow.right.circle"), for: .normal)
        sendButton.setTitle("", for: .normal)
        sendButton.tintColor = UIColor.natural
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }

    @objc private func sendButtonTapped() {
        let newMessage = chatTextView.text!
        chatList?.append(Chat(user: .user, date: "2323-12-22 22:22", message: newMessage))
        scrollToLastIndexRow()
        chatTableView.reloadData()
    }

    private func setupTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none
        scrollToLastIndexRow()
    }

    private func registerTableViewCells() {
        let xib1 = UINib(nibName: InPutTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: OutPutTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib1, forCellReuseIdentifier: InPutTableViewCell.identifier)
        chatTableView.register(xib2, forCellReuseIdentifier: OutPutTableViewCell.identifier)
    }

    private func scrollToLastIndexRow() {
        DispatchQueue.main.async {
            let index = IndexPath(row: self.chatList!.count - 1, section: 0)
            self.chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
        }
    }

    private func compareDate(date1: String, date2: String) -> Bool {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "yy.MM.dd"
        if let targetDate: Date = dateFormatter.date(from: date1),
           let fromDate: Date = dateFormatter.date(from: date2) {
            switch targetDate.compare(fromDate) {
            case .orderedSame: return false
            case .orderedDescending: return true
            case .orderedAscending: return true
            }
        }
        return false
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let chatCount = chatList?.count {
            return chatCount
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let chat = chatList?[indexPath.row] else {
            return UITableViewCell()
        }

        if chat.user == .user {
            guard let outputCell = tableView.dequeueReusableCell(
                withIdentifier: OutPutTableViewCell.identifier,
                for: indexPath
            ) as? OutPutTableViewCell else {
                return UITableViewCell()
            }
            if indexPath.row == 0 || compareDate(date1: chatList![indexPath.row - 1].formattedDate, date2: chat.formattedDate) {
                outputCell.lineView.isHidden = false
            } else {
                outputCell.lineView.isHidden = true
            }
            outputCell.setupData(chat)
            outputCell.selectionStyle = .none
            return outputCell
        } else {
            guard let inputCell = tableView.dequeueReusableCell(
                withIdentifier: InPutTableViewCell.identifier,
                for: indexPath
            ) as? InPutTableViewCell else {
                return UITableViewCell()
            }
            if indexPath.row == 0 || compareDate(date1: chatList![indexPath.row - 1].formattedDate, date2: chat.formattedDate) {
                inputCell.lineView.isHidden = false
            } else {
                inputCell.lineView.isHidden = true
            }
            inputCell.setupData(chat)
            inputCell.selectionStyle = .none
            return inputCell
        }
    }
}

extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)

        if estimatedSize.height > 67 {
            textView.isScrollEnabled = true
            return
        } else {
            textView.isScrollEnabled = false
            textViewHeightConstraint.constant = estimatedSize.height
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        let a = textView.text!
        chatList?.append(Chat(user: .user, date: "2", message: a))
        chatTableView.reloadData()
    }
}
