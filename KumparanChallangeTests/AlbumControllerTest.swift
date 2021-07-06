//
//  AlbumControllerTest.swift
//  KumparanChallangeTests
//
//  Created by Denny Arfansyah on 06/07/21.
//

import XCTest
@testable import KumparanChallange

class AlbumControllerTest: XCTestCase {

    var viewModel: AlbumViewModel!
    var mockService: MockService!
    var album: Album!
    
    override func setUp() {
        mockService = MockService()
        viewModel = .init(service: mockService)
        album = Album(userId: 1, id: 11, title: "quam nostrum impedit mollitia quod et dolor")
    }
    
    func testAlbumRequest() {
        viewModel.getPhotosRequest(with: album.id) { response in
            
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
