//
//  TodoListApp.swift
//  TodoList
//
//  Created by Wang Ruoxuan on 2/12/23.
//

import SwiftUI

@main  // tells the ios where the entry point is
struct ToDoApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView(saveTasks: {
                ModelData.save(tasks: modelData.tasks) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            })
                .environmentObject(modelData)
                .onAppear {
                    ModelData.load { result in
                        switch result {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let tasks):
                            modelData.tasks = tasks
                        }
                    }
                }
        }
    }
}

