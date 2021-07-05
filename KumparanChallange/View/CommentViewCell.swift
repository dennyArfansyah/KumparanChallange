//
//  CommentViewCell.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 06/07/21.
//

import LBTAComponents

class CommentViewCell: UITableViewCell {
    
    lazy var mainView = UIView()
    lazy var authorLabel = UILabel()
    lazy var bodyLabel = UILabel()
    var user: User!
    
    static let reusedIdentifier = String(describing: CommentViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(mainView)
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.1)
        mainView.layer.cornerRadius = 5
        mainView.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        mainView.addSubview(authorLabel)
        authorLabel.numberOfLines = 0
        authorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        authorLabel.textColor = .black
        authorLabel.anchor(mainView.topAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, topConstant: 10, leftConstant: 5, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        mainView.addSubview(bodyLabel)
        bodyLabel.numberOfLines = 0
        bodyLabel.font = UIFont.systemFont(ofSize: 12)
        bodyLabel.textColor = .lightGray
        bodyLabel.anchor(authorLabel.bottomAnchor, left: mainView.leftAnchor, bottom: mainView.bottomAnchor, right: mainView.rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 10, rightConstant: 15, widthConstant: 0, heightConstant: 0)
    }
    
    func setupData(with post: Comment) {
        authorLabel.text = post.name
        bodyLabel.text = post.body
    }
    
}
