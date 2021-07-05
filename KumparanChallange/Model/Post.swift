//
//  Post.swift
//  KumparanChallange
//
//  Created by Denny Arfansyah on 05/07/21.
//

import Foundation

struct Post: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
