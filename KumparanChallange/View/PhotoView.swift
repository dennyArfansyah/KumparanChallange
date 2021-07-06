//
//  PhotoView.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 06/07/21.
//

import LBTAComponents
import SDWebImage

extension PhotoController: UIScrollViewDelegate {
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        scrollView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        let imageWidth = view.frame.width - 20
        
        scrollView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.anchor(nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: imageWidth, heightConstant: imageWidth)
        imageView.anchorCenterYToSuperview()
        
        if let url = URL(string: photo.url) {
            let placeHolderImage = UIImage(systemName: "capsule")
            imageView.sd_setImage(with: url, placeholderImage: placeHolderImage, options: .continueInBackground, context: nil)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
}
