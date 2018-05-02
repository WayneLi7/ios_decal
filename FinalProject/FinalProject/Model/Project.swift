//
//  Project.swift
//  FinalProject
//
//  Created by weili on 4/8/18.
//  Copyright © 2018 weili. All rights reserved.
//

import Foundation
import UIKit

class Project {
    
    //Description of the project
    let desription: String
    
    //Title of the project
    let title: String
    
    /// Username of the poster
    let username: String
    
    /// The dealine that the project was due
    let deadline: String
    
    /// The ID of the project, generated automatically on Firebase
    let projId: String
    
    
    init(id: String, username: String, description: String, title: String, deadline: String) {
        self.username = username
        self.title = title
        self.desription = description
        self.deadline = deadline
        self.projId = id
    }
    
//    func getTimeElapsedString() -> String {
//        let secondsSincePosted = -date.timeIntervalSinceNow
//        let minutes = Int(secondsSincePosted / 60)
//        if minutes == 1 {
//            return "\(minutes) minute ago"
//        } else if minutes < 60 {
//            return "\(minutes) minutes ago "
//        } else if minutes < 120 {
//            return "1 hour ago"
//        } else if minutes < 24 * 60 {
//            return "\(minutes / 60) hours ago"
//        } else if minutes < 48 * 60 {
//            return "1 day ago"
//        } else {
//            return "\(minutes / 1440) days ago"
//        }
//
//    }
    
}
