//
//  Task.swift
//  CoreData-DoIt
//
//  Created by Ray Paragas on 7/12/16.
//  Copyright © 2016 Ray Paragas. All rights reserved.
//

import Foundation

class Task {
    var name : String
    var important : BooleanLiteralType
    
    init(name : String, important : BooleanLiteralType) {
        self.name = name
        self.important = important
    }
    
}
