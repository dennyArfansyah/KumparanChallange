//
//  PhotoController.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 06/07/21.
//

import UIKit

class PhotoController: UIViewController {
    
    lazy var scrollView = UIScrollView()
    lazy var imageView = UIImageView()
    let photo: Photo!
    
    init(photo: Photo) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
}
