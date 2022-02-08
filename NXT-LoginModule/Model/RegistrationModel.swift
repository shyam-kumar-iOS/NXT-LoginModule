//
//  RegistrationModel.swift
//  NXT-LoginModule
//
//  Created by Shyam Kumar on 08/02/22.
//

import Foundation

public struct RegistrationModel: Codable {
    let code: Int?
    let message: String?
    let data: RegistrationData?
}

// MARK: - DataClass
public struct RegistrationData: Codable {
    let id: Int?
    let name, email, token: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case email = "Email"
        case token = "Token"
    }
}

