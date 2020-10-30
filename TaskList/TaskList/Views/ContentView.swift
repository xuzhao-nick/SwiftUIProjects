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
                ForEach(taskStore.prioritizedTasks) { index in
                    SectionView(prioritizedTasks: self.$taskStore.prioritizedTasks[index])
                }
            }
            .listStyle(GroupedListStyle())
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


