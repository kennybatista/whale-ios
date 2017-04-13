//
//  AnswerParser.swift
//  whale-ios
//
//  Created by Kenny Batista on 4/12/17.
//  Copyright © 2017 Kenny Batista. All rights reserved.
//

import Foundation

class AnswerParser {
    
    class func parse(json: Any) -> Answer {
        print("Parsing", json)
        
        if let dictionary = json as? [String: Any] {
            
            for answer in dictionary {
                print("Dictionary: ", dictionary)
                
                print("Answer: ", answer)
                
                if String(answer.key) == "data" {
                    let data = answer.value
                    let videoURL = data["thumbnail_url"] as? [Any]
                    print(videoURL)
                }
//                
//                if String(describing: answer.value) == "data" {
//                    print("answer value", answer.key)
//                } else {
//                    print("Error, there is no key")
//                }
////                print("Video url : ", videoURL)
            }
            
        } else {
            print("There is no dictionary, only an error")
        }
        
        
        
        let answer = Answer(videoURL: "allo", thumbnailURL: "alabama", question: ["lala": "boby"], likes: "lala", id: "lala", comment: "lala")
        
        return answer
    }
}


struct Answer {
    let videoURL     : String!
    let thumbnailURL : String!
    let question     : [String: Any]
    let likes        : String!
    let id           : String!
    let comment      : String!
    
}
