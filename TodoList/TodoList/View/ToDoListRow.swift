//
//  ToDoListRow.swift
//  TodoList
//
//  Created by Wang Ruoxuan on 2/14/23.
//

import SwiftUI

struct ToDoListRow: View {
    
    var task: Task // The task object that this row will depict
    @EnvironmentObject var modelData: ModelData
    
    // A computed property computing the index of this task in the array contained in ModelData
    // We'll use this to modify the global tasks array contained in our global state
    var taskIndex: Int {
        modelData.tasks.firstIndex(where: {
            $0.id == task.id
        }) ?? 0
    }
    
    var body: some View {
        // HStack allows us to group multiple Views in a horizontal fashion and return a single parent View called HStack
        HStack {
            // VStack allows us to group multiple Views in a vertical fashion and return a single parent View called VStack
            VStack(alignment: .leading) {
                Text(task.name)
                    .font(.headline)
                Text(task.description != "" ? task.description : "No description")
                    .font(.subheadline)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            Spacer() // Expands to consume all remaining space and push the previous and next Views to the edges.
            Checkbox(isChecked: $modelData.tasks[taskIndex].isDone)
        }
    }
    
}
