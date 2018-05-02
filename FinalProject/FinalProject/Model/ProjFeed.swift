//
//  ProjFeed.swift
//  FinalProject
//
//  Created by weili on 4/8/18.
//  Copyright © 2018 weili. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

var userProjs = [Project]()

func addProjToLocal(project : Project) {
    userProjs.append(project)
}

func clearLocalProjs() {
    userProjs = []
}

func getProjFromIndexPath(indexPath: IndexPath) -> Project? {
    return userProjs[indexPath.row]
}

func getProjs(completion: @escaping ([Project]?) -> Void) {
    //TODO
    let dbRef = Database.database().reference()
    var projArray: [Project] = []
    dbRef.child(firProjNode).observeSingleEvent(of: .value, with: { snapshot -> Void in
        if snapshot.exists() {
            if let projs = snapshot.value as? [String:AnyObject] {
                for projKey in projs.keys {
                    let proj = projs[projKey] as! [String:AnyObject]
                    let temp = Project(id: projKey, username: proj["username"] as! String, description: proj["projDescription"] as! String, title: proj["projectTitle"] as! String, deadline: proj["deadline"] as! String)
                    projArray.append(temp)
                }
                completion(projArray)
            }else {
                completion(nil)
            }
        } else {
            completion(nil)
        }
    })
}
