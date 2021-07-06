//
//  UserControllerTest.swift
//  KumparanChallangeTests
//
//  Created by Denny Arfansyah on 06/07/21.
//

import XCTest
@testable import KumparanChallange

class UserControllerTest: XCTestCase {

    var viewModel: UserViewModel!
    var mockService: MockService!
    var user: User!
    
    override func setUp() {
        mockService = MockService()
        viewModel = .init(service: mockService)
        
        let geo = Geo(lat: "-37.3159", lng: "81.1496")
        let address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: geo)
        let company = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
        user = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: address, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: company)
        viewModel.user = user
    }
    
    private func testPostNUserData() {
        XCTAssertEqual(viewModel.usernameNAddress, "\(user.name), \(user.company.name)")
        XCTAssertEqual(viewModel.email, user.email)
        XCTAssertEqual(viewModel.address, "\(user.address.suite), \(user.address.street), \(user.address.city) \(user.address.zipcode)")
    }
    
    private func testAlbumRequest() {
        viewModel.getAlbumsRequest(with: user.id) { response in
            switch response {
            case .success(let album):
                XCTAssertNotNil(album)
            case .failure(let err):
                let er = err as NSError
                XCTFail(er.domain)
            }
        }
    }
    
}
