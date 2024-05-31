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

    private func setupNavigationUI() {
        navigationItem.title = chatroomName
    }

    private func setupTextViewBackgroundViewUI() {
        textViewBackgroundView.backgroundColor = UIColor.secondary
        textViewBackgroundView.layer.cornerRadius = 10
    }

    private func setupTextViewUI() {
        chatTextView.text = ""
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
    }

    private func registerTableViewCells() {
        let xib1 = UINib(nibName: InPutTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: OutPutTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib1, forCellReuseIdentifier: InPutTableViewCell.identifier)
        chatTableView.register(xib2, forCellReuseIdentifier: OutPutTableViewCell.identifier)
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
            return outputCell
        } else {
            inputCell.setupData(chat)
            return inputCell
        }
    }
}
