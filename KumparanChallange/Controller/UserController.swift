//
//  UserController.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import UIKit
import Toast_Swift

class UserController: UITableViewController {
    
    var user: User!
    var viewModel = UserViewModel()
    
    init(user: User, style: UITableView.Style = .plain) {
        super.init(style: style)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        viewModel.getAlbumsRequest(with: user.id) { response in
            
            switch response {
            case .success(_):
                self.tableView.reloadData()
            case .failure(let err):
                let er = err as NSError
                self.view.makeToast(er.domain)
            }
            
        }
    }
    
}
