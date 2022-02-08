//
//  LoginViewModel.swift
//  NXT-LoginModule
//
//  Created by Shyam Kumar on 08/02/22.
//

import Foundation
import RestEngine

public class LoginViewModel {
    
    public init() {}
    var restSession = RestSession()
    
    public func loginAction(username: String, Password: String, completion: @escaping (Bool) -> Void) {
        let url = "http://restapi.adequateshop.com/api/authaccount/login"
        let params = ["email": username,
                      "password": Password] as [String : AnyObject]
        let headers = ["Content-Type": "application/json"]
        let resource = Resource<LoginModel>(urlString: url, parameters: params, headers: headers)
        restSession.makePostRequest(resource) { userLoggedIn in
            if let userLoggedIn = userLoggedIn, userLoggedIn.data?.dataID! != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    public func registerAction(username: String, Password: String, name: String, completion: @escaping (Bool) -> Void) {
        let url = "http://restapi.adequateshop.com/api/authaccount/registration"
        let params = ["email": username,
                      "password": Password, "name": name] as [String : AnyObject]
        let headers = ["Content-Type": "application/json"]
        let resource = Resource<RegistrationModel>(urlString: url, parameters: params, headers: headers)
        restSession.makePostRequest(resource) { userRegistered in
            if let userRegistered = userRegistered, userRegistered.data?.id! != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
