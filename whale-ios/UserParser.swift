//
//  UserParser.swift
//  whale-ios
//
//  Created by Kenny Batista on 4/7/17.
//  Copyright © 2017 Kenny Batista. All rights reserved.
//

import Foundation

class UserParser {
    
    class func parseUser(json: Any) -> User {
        
        var parsedUser: User!
        
        if let dictionary = json as? [String: Any] {
            
            let username = dictionary["username"] as? String
            let firstName = dictionary["username"] as? String
            let lastName = dictionary["last_name"] as? String
            let image_url = dictionary["image_url"] as? String
            let id = dictionary["id"] as? String
            let followingCount = dictionary["following_count"] as? String
            let followerCount = dictionary["follower_count"] as? String
            let email = dictionary["email"] as? String
            
            parsedUser = User(username: username, firstName: firstName, lastName: lastName, image_url: image_url, id: id, followingCount: followingCount, followerCount: followerCount, email: email)
            
        }
        
        print(parsedUser)
        return parsedUser
        
    }
}

struct User {
    let username:       String!
    let firstName:      String!
    let lastName:       String!
    let image_url:      String!
    let id:             String!
    let followingCount: String!
    let followerCount:  String!
    let email:          String!
}
