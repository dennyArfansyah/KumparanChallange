//
//  AlbumViewModel.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import Foundation

class AlbumViewModel {
    
    private let service: ServiceProtocol
    var photos: [Photo]?
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func getPhotosRequest(with albumId: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums/\(albumId)/photos")!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    self.photos = photos.map { return Photo(albumId: $0.albumId, id: $0.id, title: $0.title, url: $0.url, thumbnailUrl: $0.thumbnailUrl) }
                    completion(.success(photos))
                } catch {
                    completion(.failure(NSError(domain: error.localizedDescription, code: 1, userInfo: nil)))
                }
            case .failure(let err):
                let er = err as NSError
                completion(.failure(NSError(domain: er.domain, code: 1, userInfo: nil)))
            }
        }
    }
    
}
