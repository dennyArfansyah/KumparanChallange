//
//  DetailControllerTest.swift
//  KumparanChallangeTests
//
//  Created by Denny Arfansyah on 06/07/21.
//

import XCTest
@testable import KumparanChallange

class DetailControllerTest: XCTestCase {

    var viewModel: DetailViewModel!
    var mockService: MockService!
    var post: Post!
    var user: User!
    
    override func setUp() {
        mockService = MockService()
        viewModel = .init(service: mockService)
        post = Post(userId: 1, id: 1,
                    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                    body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
        viewModel.post = post
        
        let geo = Geo(lat: "-37.3159", lng: "81.1496")
        let address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: geo)
        let company = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
        user = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: address, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: company)
        viewModel.author = "Author: \(user.username), \(user.company.name)"
    }
    
    private func testPostNUserData() {
        XCTAssertEqual(viewModel.post.title, post.title)
        XCTAssertEqual(viewModel.post.body, post.body)
        XCTAssertEqual(viewModel.author, "Author: \(user.username), \(user.company.name)")
    }

    private func testCommentRequest() {
        viewModel.getCommentsRequest(with: post.id) { response in
            switch response {
            case .success(let post):
                XCTAssertNotNil(post)
            case .failure(let err):
                let er = err as NSError
                XCTFail(er.domain)
            }
        }
    }

}
