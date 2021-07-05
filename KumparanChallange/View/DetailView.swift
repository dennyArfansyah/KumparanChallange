//
//  DetailView.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import LBTAComponents

extension DetailController {
    
    func setupLayout() {
        tableView.register(HeaderDetailView.self, forHeaderFooterViewReuseIdentifier: HeaderDetailView.identifier)
        tableView.register(CommentViewCell.self, forCellReuseIdentifier: CommentViewCell.reusedIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 75
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
        let headerDetailView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderDetailView.identifier) as! HeaderDetailView
        headerDetailView.setupHeaderData(with: viewModel.post, and: viewModel.author)
        headerDetailView.gotoDetailController = {
            let controller = UserController(user: self.user)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        return headerDetailView
    }
    
}
