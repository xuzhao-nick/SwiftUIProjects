//
//  NewTaskView.swift
//  TaskList
//
//  Created by Nick Xu on 25/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import SwiftUI

struct NewTaskView: View {
    var taskStore: TaskStore
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    var body: some View {
        Form {
            TextField("Task Name", text: $text)
            Button("Add") {
                self.taskStore.appendTask(self.text)
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(text.isEmpty)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore())
    }
}
