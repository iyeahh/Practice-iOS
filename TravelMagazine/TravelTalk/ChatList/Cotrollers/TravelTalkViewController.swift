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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchBar()
        setupTableView()
        registerTableViewCells()
        chatList = chatAllList
    }

    private func setupUI() {
        navigationItem.title = "TRAVEL TALK"
    }

    private func setupSearchBar() {
        talkSearchBar.delegate = self
        talkSearchBar.placeholder = "친구 이름을 검색해보세요"
    }

    private func setupTableView() {
        talkTableView.delegate = self
        talkTableView.dataSource = self
        talkTableView.rowHeight = 70
        talkTableView.separatorStyle = .none
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "ChatView", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChatViewController.identifier) as? ChatViewController else {
            return
        }
        vc.chatroomName = chatList[indexPath.row].chatroomName
        vc.chatList = chatList[indexPath.row].chatList
        navigationController?.pushViewController(vc, animated: true)
        tableView.reloadRows(at: [indexPath], with: .none)
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
