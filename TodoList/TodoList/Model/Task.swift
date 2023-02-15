//
//  Task.swift
//  TodoList
//
//  Created by Wang Ruoxuan on 2/12/23.
//

import Foundation

struct Task: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isDone: Bool
    var lastModified: Date
}
