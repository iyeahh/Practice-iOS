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

        textViewConstraint.constant = keyboardHeight - tabBarHeight + 10
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
    }

    private func setupButtonUI() {
        sendButton.backgroundColor = .clear
        sendButton.setImage(UIImage(systemName: "arrow.right.circle"), for: .normal)
        sendButton.setTitle("", for: .normal)
        sendButton.tintColor = UIColor.natural
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
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let chatCount = chatList?.count {
            return chatCount
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard 
            let inputCell = tableView.dequeueReusableCell(
            withIdentifier: InPutTableViewCell.identifier,
            for: indexPath) as? InPutTableViewCell,
            let outputCell = tableView.dequeueReusableCell(
                withIdentifier: OutPutTableViewCell.identifier,
                for: indexPath) as? OutPutTableViewCell,
            let chat = chatList?[indexPath.row] else {
            return UITableViewCell()
        }

        if chat.user == .user {
            outputCell.setupData(chat)
            outputCell.selectionStyle = .none
            return outputCell
        } else {
            inputCell.setupData(chat)
            inputCell.selectionStyle = .none
            return inputCell
        }
    }
}
