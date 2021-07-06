//
//  DetailView.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import LBTAComponents

extension DetailController {
    
    func setupLayout() {
        tableView.register(HeaderTableView.self, forHeaderFooterViewReuseIdentifier: HeaderTableView.identifier)
        tableView.register(CommentViewCell.self, forCellReuseIdentifier: CommentViewCell.reusedIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 75
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.comments?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentViewCell.reusedIdentifier, for: indexPath) as! CommentViewCell
        if let comment = viewModel.comments?[indexPath.row] {
            cell.setupData(with: comment)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        let headerTableView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderTableView.identifier) as! HeaderTableView
        headerTableView.titleLabel.text = post.title
        headerTableView.usernameLabel.text = viewModel.author
        headerTableView.bodyLabel.text = post.body
        headerTableView.comments.text = "Comments"
        headerTableView.gotoDetailController = {
            self.setupUserController(with: self.user)
        }
        return headerTableView
    }
    
}
