//
//  PostController.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import UIKit
import Toast_Swift

class PostController: UITableViewController {
    
    var viewModel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        viewModel.getPostRequest { response in

            switch response {
            case .success(_):
                self.tableView.reloadData()
            case .failure(let err):
                let er = err as NSError
                self.tableView.makeToast(er.domain)
            }

        }
    }
    
    func didPostCellClicked(with post: Post) {
        viewModel.getUserRequest(with: post.userId) { response in

            switch response {
            case .success(let user):
                let controller = DetailController(post: post, user: user, style: .plain)
                self.navigationController?.pushViewController(controller, animated: true)
            case .failure(let err):
                let er = err as NSError
                self.view.makeToast(er.domain)
            }

        }
    }

}
