//
//  HomeViewModel.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import UIKit

class PostViewModel {
    
    var title = "Post"
    let service: ServiceProtocol
    var posts = [Post]()
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func getPostRequest(completion: @escaping (Result<[Post], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    self.posts = posts.map { return Post(userId: $0.userId, id: $0.id, title: $0.title, body: $0.body) }
                    completion(.success(posts))
                } catch {
                    completion(.failure(NSError(domain: error.localizedDescription, code: 0, userInfo: nil)))
                }
            case .failure(let err):
                let er = err as NSError
                completion(.failure(NSError(domain: er.domain, code: 1, userInfo: nil)))
            }
        }
    }
    
    func getUserRequest(with userId: Int, completion: @escaping (Result<User, Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)")!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    completion(.success(user))
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
