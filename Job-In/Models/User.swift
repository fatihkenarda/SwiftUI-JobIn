//
//  User.swift
//  Job-In
//
//  Created by Fatih Kenarda on 24.02.2025.
//

import Foundation

struct User: Encodable, Decodable {
    var uid: String
    var email: String
    var profileImageUrl: String
    var username: String
    var searchName: [String]
    var jobName: String
}
