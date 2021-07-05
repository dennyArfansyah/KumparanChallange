//
//  HeaderTableView.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import LBTAComponents

class HeaderDetailView: UITableViewHeaderFooterView {
    
    lazy var titleLabel = UILabel()
    lazy var usernameLabel = UILabel()
    lazy var usernameButton = UIButton()
    lazy var bodyLabel = UILabel()
    let comments = UILabel()
    
    var gotoDetailController:( () -> Void)?
    
    static let identifier = String(describing: HeaderDetailView.self)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.addSubview(usernameButton)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(comments)
    }
    
    private func setupHierarchy() {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.textColor = .black
        titleLabel.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        usernameLabel.textColor = .black
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 13)
        usernameLabel.anchor(titleLabel.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        usernameLabel.textAlignment = .left
        
        usernameButton.backgroundColor = .clear
        usernameButton.anchor(titleLabel.bottomAnchor, left: contentView.leftAnchor, bottom: usernameLabel.bottomAnchor, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        usernameButton.addTarget(self, action: #selector(usernameButtonPressed), for: .touchUpInside)
        
        bodyLabel.numberOfLines = 0
        bodyLabel.font = UIFont.systemFont(ofSize: 13)
        bodyLabel.textColor = .lightGray
        bodyLabel.anchor(usernameButton.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        comments.text = "Comments"
        comments.font = UIFont.boldSystemFont(ofSize: 14)
        comments.textColor = .black
        comments.anchor(bodyLabel.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 15, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
    func setupHeaderData(with post: Post, and author: String) {
        titleLabel.text = post.title
        usernameLabel.text = author
        bodyLabel.text = post.body
    }
    
    @objc func usernameButtonPressed() {
        gotoDetailController?()
    }
    
}
