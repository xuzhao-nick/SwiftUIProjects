//
//  SectionView.swift
//  TaskList
//
//  Created by Nick Xu on 30/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import SwiftUI

struct SectionHeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            if #available(iOS 14, *) {
                AnyView(content.textCase(.none))
            } else {
                content
            }
        }
    }
}

struct SectionView: View {
    @Binding var prioritizedTasks: TaskStore.PrioritizedTasks
    var body: some View {
        Section(header:
                    Text("\(prioritizedTasks.priority.rawValue.capitalized) Priority")) {
            ForEach(prioritizedTasks.tasks) { index in
                RowView(task:self.$prioritizedTasks.tasks[index])
            } .onMove{ sourceIndices, destinationIndex in
                self.prioritizedTasks.tasks.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
                
                }
            .onDelete{ indexSet in
                self.prioritizedTasks.tasks.remove(atOffsets: indexSet) 
            }
        }.modifier(SectionHeaderStyle())
    }
}

