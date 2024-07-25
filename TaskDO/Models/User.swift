//
//  User.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
