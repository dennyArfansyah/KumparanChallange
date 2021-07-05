//
//  MockService.swift
//  KumparanChallangeTests
//
//  Created by Denny Arfansyah on 05/07/21.
//

@testable import KumparanChallange
import Alamofire

class MockService: ServiceProtocol {
    
    func request(with url: URL, method: HTTPMethod, parameter: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        
        // change _dummy_data.json for response data inside Resource folder
        // just using wrong file dummy data to make it failed
        if let path = Bundle.main.path(forResource: "/comment_dummy_data", ofType: ".json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                completion(.success(data))
            } catch {
                print(error.localizedDescription)
                completion(.failure(NSError(domain: error.localizedDescription, code: -1, userInfo: nil)))
            }
        } else {
            completion(.failure(NSError(domain: Constants.noResourceFound, code: -1, userInfo: nil)))
        }
        
    }
    
}

