//
//  DetailViewModel.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import Foundation
import Toast_Swift

class DetailViewModel {
    
    private let service: ServiceProtocol
    var comments: [Comment]?
    var author = ""
    var post: Post!
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func setupHeaderData(with post: Post, and user: User) {
        self.post = post
        author = "Author: \(user.username), \(user.company.name)"
    }
    
    func getCommentsRequest(with postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)")!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let comments = try JSONDecoder().decode([Comment].self, from: data)
                    self.comments = comments.map { return Comment(postId: $0.postId, id: $0.id, name: $0.name, email: $0.email, body: $0.body) }
                    completion(.success(comments))
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
