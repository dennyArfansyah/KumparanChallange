//
//  GridCell.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import LBTAComponents
import SDWebImage

class GridCell: UICollectionViewCell {
    
    let genreLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        backgroundColor = .lightGray
        
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        contentView.addSubview(genreLabel)
        genreLabel.numberOfLines = 0
        genreLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        genreLabel.textAlignment = .center
        
        genreLabel.anchor(nil, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        genreLabel.anchorCenterSuperview()
    }
    
    func setupData(with photo: Photo) {
        genreLabel.text = photo.title
        let url = URL(string: photo.thumbnailUrl)!
        let placeHolderImage = UIImage(systemName: "swift")
        imageView.sd_setImage(with: url, placeholderImage: placeHolderImage, options: .continueInBackground, context: nil)
    }
    
}
