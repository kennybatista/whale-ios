//
//  NetworkHelper.swift
//  whale-ios
//
//  Created by Kenny Batista on 4/3/17.
//  Copyright © 2017 Kenny Batista. All rights reserved.
//

import Foundation
import KeychainAccess


struct NetworkHelper {
    
    //[S - RETURNED DATA/ COMPLETIONS]
    // the result of the connection is stored here. It's either success or failure
    typealias CallCompletion = (CallResponse) -> Void
    
    
    // Here we create the blueprints of the response we receive, it's either a success or failure
    enum CallResponse {
        case success(receivedData)
        case failure(Error)
    }
    
    struct receivedData {
        public let user: User
    }
    //[E - RETURNED DATA/ COMPLETIONS]
    
    
    
    
    
    
    
//[S - SIGN IN]
    static func signIn(email: String, password: String, completion: @escaping CallCompletion) {
        print(#function)
        
        
        //Create url
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "whale2-elixir.herokuapp.com"
        urlComponents.path = "/api/v1/sessions"
        
        
        // add params
        let emailQuery = URLQueryItem(name: "email", value: email)
        let passwordQuery = URLQueryItem(name: "password", value: password)
        
        urlComponents.queryItems = [emailQuery, passwordQuery]
        
        
        
        
        // Create request, and HTTP method
        var request = URLRequest(url: urlComponents.url!)
        
        request.httpMethod = "POST"
        
        
        
        
        // Make the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("There was an error : ", error!)
                completion(.failure(error!))
            } else { //There was no error, continue
                //json
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    let parsedUser = UserParser.parseUser(json: json)
                    completion(.success(receivedData(user: parsedUser)))
                } catch {
                    completion(.failure(error))
                    return
                }
                
                
            }
        }
        
        task.resume()
    }
//[E - SIGN IN]
    
    static func signUp(email: String, first_name: String, last_name: String, password: String, username: String, completion: @escaping CallCompletion){
        print(#function)
        
        //Create url
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "whale2-elixir.herokuapp.com"
        urlComponents.path = "/api/v1/users"
        
        
        // Create request, and HTTP method
        var request = URLRequest(url: urlComponents.url!)
        
        // set the request method to POST
        request.httpMethod = "POST"
        
        // json to send to the body
        let json : [String: Any] = ["email": email,"first_name": first_name, "last_name": last_name,"password": password, "username": username]
        
        // Convert json to data to enable passing to serialization
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        
        //make the request
        // Make the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("There was an error : ", error!)
                completion(.failure(error!))
            } else { //There was no error, continue
                //json
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    let parsedUser = UserParser.parseUser(json: json)
                    completion(.success(receivedData(user: parsedUser)))
                } catch {
                    completion(.failure(error))
                    return
                }
                
                
            }
        }
        
        task.resume()
    }
    
    
    
//[S - SIGN UP]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//[E - SIGN UP]
}
