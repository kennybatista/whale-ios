//
//  ViewController.swift
//  whale-ios
//
//  Created by Kenny Batista on 4/3/17.
//  Copyright © 2017 Kenny Batista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func signInButton(_ sender: Any) {
        
        NetworkHelper.signIn(email: "gordoneliel@gmail.com", password: "example") { (response) in
            print(response)
        }
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        NetworkHelper.signUp(email: "lala@gmail.com", first_name: "Kenny", last_name: "Batista", password: "abc123", username: "lala") { (response) in
            print(response)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }


    
    
    
    
    
}

