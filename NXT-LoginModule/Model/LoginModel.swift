//
//  LoginModel.swift
//  NXT-LoginModule
//
//  Created by Shyam Kumar on 08/02/22.
//

import Foundation

public struct LoginModel: Codable {
    let code: Int?
    let message: String?
    let data: LoginData?

    enum CodingKeys: String, CodingKey {
        case code, message, data
    }
}

// MARK: - DataClass
public struct LoginData: Codable {
    let dataID: Int?
    let name, email, token: String?

    enum CodingKeys: String, CodingKey {
        case dataID = "Id"
        case name = "Name"
        case email = "Email"
        case token = "Token"
    }
}
