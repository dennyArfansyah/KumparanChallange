//
//  DetailController.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import UIKit

class DetailController: UITableViewController {
    
    var post: Post!
    var user: User!
    var viewModel = DetailViewModel()
    
    init(post: Post, user: User, style: UITableView.Style) {
        super.init(style: .plain)
        self.post = post
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setupHeaderData(with: post, and: user)
        setupLayout()
        viewModel.getCommentsRequest(with: post.id) { response in
            
            switch response {
            case .success(_):
                self.tableView.reloadData()
            case .failure(let err):
                let er = err as NSError
                self.tableView.makeToast(er.domain)
            }
            
        }
    }
    
}
