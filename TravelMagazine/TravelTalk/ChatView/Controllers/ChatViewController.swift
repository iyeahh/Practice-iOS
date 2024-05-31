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

    var chatList: [Chat]?
    var chatroomName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        registerTableViewCells()
    }

    private func setupUI() {
        navigationItem.title = chatroomName
        view.backgroundColor = UIColor.chatBackground
        chatTableView.backgroundColor = UIColor.chatBackground
    }

    private func setupTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
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
