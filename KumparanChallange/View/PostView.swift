//
//  HomeView.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import LBTAComponents

extension PostController {
    
    func setupLayout() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupTableView() {
        tableView.register(PostViewCell.self, forCellReuseIdentifier: PostViewCell.reusedIdentifier)
        tableView.rowHeight = 65
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
        let post = viewModel.posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PostViewCell.reusedIdentifier, for: indexPath) as! PostViewCell
        cell.setupData(with: post)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = viewModel.posts[indexPath.row]
        didPostCellClicked(with: post)
    }
    
}
