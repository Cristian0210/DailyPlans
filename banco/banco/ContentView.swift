//
//  ContentView.swift
//  banco
//
//  Created by Cristian Vangheli on 3/8/23.
//

import SwiftUI

struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
}

struct ContentView: View {
    @State private var tasks: [TaskItem] = []
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                            Text(task.title)
                            Spacer()
                            Button(action: {
                                toggleTaskCompletion(task)
                            }) {
                                Text(task.isCompleted ? "Uncheck" : "Mark")
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue, lineWidth: 1)
                                    )
                            }
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(PlainListStyle())

                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        addTask()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Task List")
            .padding()
        }
    }

    func addTask() {
        let trimmedTitle = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }

        let newTask = TaskItem(title: trimmedTitle)
        tasks.append(newTask)

        newTaskTitle = ""
    }

    func toggleTaskCompletion(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









