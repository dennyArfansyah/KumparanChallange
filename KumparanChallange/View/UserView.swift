//
//  UserView.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import LBTAComponents

extension UserController {
    
    func setupLayout() {
        tableView.register(HeaderDetailView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 75
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = viewModel.albums?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = album?.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = (viewModel.albums?[indexPath.row])!
        let controller = AlbumController(album: album)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerTableView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! HeaderDetailView
        headerTableView.titleLabel.text = user.name
        headerTableView.usernameButton.setTitle("\(user.username)", for: .normal)
        headerTableView.bodyLabel.text = user.email
        return headerTableView
    }
    
}
