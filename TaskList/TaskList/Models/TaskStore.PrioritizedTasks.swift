//
//  TaskStore.PrioritizedTasks.swift
//  TaskList
//
//  Created by Nick Xu on 30/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

extension TaskStore {
    struct PrioritizedTasks {
        let priority: Task.Priority
        var tasks: [Task]
    }
}

extension TaskStore.PrioritizedTasks: Identifiable {
    var id: Task.Priority { priority }
}
