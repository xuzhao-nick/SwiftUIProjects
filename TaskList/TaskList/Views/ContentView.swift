//
//  ContentView.swift
//  TaskList
//
//  Created by Nick Xu on 24/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore:TaskStore
    @State var modalIsPresented = false
    var body: some View {
        NavigationView {
            List{
                ForEach(taskStore.tasks) { index in
                    RowView(task:self.$taskStore.tasks[index])
                }
            .onMove{ sourceIndices, destinationIndex in
                self.taskStore.tasks.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
                    
                    }
            .onDelete{
                indexSet in
                let indexes = indexSet.map({$0})
            self.taskStore.removeTask(indexes[0]) //self.taskStore.tasks.remove(atOffsets: indexSet)
                }
                
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                    self.modalIsPresented = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $modalIsPresented) {
            NewTaskView(taskStore: self.taskStore)
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}


