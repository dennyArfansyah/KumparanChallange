//
//  UserViewModel.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import Foundation

class UserViewModel {
    
    private let service: ServiceProtocol
    var albums: [Album]?
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func getAlbumsRequest(with userId: Int, completion: @escaping (Result<[Album], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)/albums")!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode([Album].self, from: data)
                    self.albums = albums.map { return Album(userId: $0.userId, id: $0.id, title: $0.title) }
                    completion(.success(albums))
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
