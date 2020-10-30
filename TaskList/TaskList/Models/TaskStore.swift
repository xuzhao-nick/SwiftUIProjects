//
//  TaskStore.swift
//  TaskList
//
//  Created by Nick Xu on 24/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//
import Combine
import SwiftUI
import Foundation

class TaskStore:ObservableObject {
    @Published var tasks = [
        "Code a SwiftUI app",
        "Book an escape room",
        "Walk the cat",
        "Pick up heavy things and put them down",
        "Make karaoke playlist",
        "Present at iOS meetup group",
        "Climb EI Captan",
        "Learn to make baklava",
        "Play disk golf in every state",
        "100 movie reboot marathon",
        ].map{ Task(name: $0)}
    func appendTask(_ name:String) {
        self.tasks.append(Task(name: name))
    }
    func removeTask(_ index:Int) {
        self.tasks.remove(at: index)
    }

}
