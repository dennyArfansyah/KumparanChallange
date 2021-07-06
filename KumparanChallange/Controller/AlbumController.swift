//
//  AlbumController.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import UIKit

class AlbumController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var album: Album!
    var viewModel = AlbumViewModel()
    
    init(album: Album) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.album = album
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        viewModel.getPhotosRequest(with: album.id) { response in
            
            switch response {
            case .success(_):
                self.collectionView.reloadData()
            case .failure(let err):
                let er = err as NSError
                self.collectionView.makeToast(er.domain)
            }
            
        }
    }
    
    func didSelectPhoto(with photo: Photo) {
        let controller = PhotoController(photo: photo)
        present(controller, animated: true, completion: nil)
    }
}

