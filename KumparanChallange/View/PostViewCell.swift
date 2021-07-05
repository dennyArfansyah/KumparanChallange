//
//  PostViewCell.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import LBTAComponents

class PostViewCell: UITableViewCell {
    
    lazy var mainView = UIView()
    lazy var accessoryTypeImage = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var bodyLabel = UILabel()
    var user: User!
    
    static let reusedIdentifier = String(describing: PostViewCell.self)
    
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
        
        mainView.addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        titleLabel.textColor = .black
        titleLabel.anchor(mainView.topAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 20)
        
        mainView.addSubview(bodyLabel)
        bodyLabel.font = UIFont.systemFont(ofSize: 12)
        bodyLabel.textColor = .lightGray
        bodyLabel.anchor(titleLabel.bottomAnchor, left: mainView.leftAnchor, bottom: mainView.bottomAnchor, right: mainView.rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 5, rightConstant: 15, widthConstant: 0, heightConstant: 20)
    }
    
    func setupData(with post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
}
