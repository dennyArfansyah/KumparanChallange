//
//  KumparanChallangeTests.swift
//  KumparanChallangeTests
//
//  Created by Denny Arfansyah on 05/07/21.
//

import XCTest
@testable import KumparanChallange

class KumparanChallangeTests: XCTestCase {
    
    var viewModel: PostViewModel!
    var mockService: MockService!
    
    override func setUp() {
        mockService = MockService()
        viewModel = .init(service: mockService)
    }

    func testPostRequest() {
        viewModel.getPostRequest { response in 
            switch response {
            case .success(let post):
                XCTAssertNotNil(post)
            case .failure(let err):
                let er = err as NSError
                XCTFail(er.domain)
            }
        }
    }
    
    func testUserRequest() {
        viewModel.getUserRequest(with: 2) { response in
            switch response {
            case .success(let user):
                XCTAssertNotNil(user)
                XCTAssertEqual(user.username, "Antonette")
            case .failure(let err):
                let er = err as NSError
                XCTFail(er.domain)
            }
        }
    }

}
