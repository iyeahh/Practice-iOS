//
//  TravelTalkViewController.swift
//  TravelMagazine
//
//  Created by Bora Yang on 5/31/24.
//

import UIKit

class TravelTalkViewController: UIViewController {
    @IBOutlet var talkSearchBar: UISearchBar!
    @IBOutlet var talkTableView: UITableView!

    let chatAllList = ChatRoom.chatList
    var chatList: [ChatRoom] = [] {
        didSet {
            talkTableView.reloadData()
        }
    }
    var tempArray: [ChatRoom] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        registerTableViewCells()
        chatList = chatAllList
    }

    private func setupSearchBar() {
        talkSearchBar.delegate = self
    }

    private func setupTableView() {
        talkTableView.delegate = self
        talkTableView.dataSource = self
        talkTableView.rowHeight = 100
    }

    private func registerTableViewCells() {
        let xib1 = UINib(nibName: PersonTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: PeopleTableViewCell.identifier, bundle: nil)
        talkTableView.register(xib1, forCellReuseIdentifier: PersonTableViewCell.identifier)
        talkTableView.register(xib2, forCellReuseIdentifier: PeopleTableViewCell.identifier)
    }
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let personCell = tableView.dequeueReusableCell(
            withIdentifier: PersonTableViewCell.identifier,
            for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }

        guard let peopleCell = tableView.dequeueReusableCell(
            withIdentifier: PeopleTableViewCell.identifier,
            for: indexPath) as? PeopleTableViewCell else {
            return UITableViewCell()
        }

        let data = chatList[indexPath.row]

        if data.chatroomImage.count == 1 {
            personCell.setupData(data)
            return personCell
        } else if data.chatroomImage.count == 4 {
            peopleCell.setupData(data)
            return peopleCell
        }
        return UITableViewCell()
    }
}

extension TravelTalkViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        chatList = chatAllList.filter { chatRoom in
            chatRoom.chatroomName.contains(searchBar.text ?? "")
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        chatList = chatAllList.filter { chatRoom in
            chatRoom.chatroomName.contains(searchText)
        }
    }
}
