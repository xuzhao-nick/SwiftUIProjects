//
//  Task.swift
//  TaskList
//
//  Created by Nick Xu on 24/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//
import Foundation

struct Task: Identifiable {
    let id = UUID()
    
    var name: String
    var completed = false
}
