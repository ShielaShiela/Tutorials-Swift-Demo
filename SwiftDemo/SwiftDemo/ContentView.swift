//
//  ContentView.swift
//  SwiftDemo
//
//  Created by Shiela Cabahug on 2026/11/12.
//
//
//  ContentView.swift
//  sampleAPP
//
//  Created by Shiela Cabahug on 2026/10/23.
//

import SwiftUI
import SwiftData


struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isDone = false
}

struct ContentView: View {
    @State private var text = ""
    @State private var tasks: [TodoItem] = []
    @State private var showAlert = false
    
    // add two trackers for editing
    @State private var isShowingEdit = false
    @State private var taskBeingEdited: TodoItem? = nil
    @State private var editedText = ""
    
    var body: some View {
        VStack{
            HStack{
                TextField("New Task",text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add")
                {
                    if text.isEmpty {
                        showAlert = true
                    } else {
                        tasks.append(TodoItem(title: text))
                        text = ""
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            
            List {
                LazyVStack (alignment: .leading, spacing: 20) {
                    ForEach($tasks) { $task in
                        Button {
                            task.isDone.toggle()
                        } label: {
                            HStack {
                                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(task.isDone ? .green : .gray)
                                
                                Text(task.title)
                                    .strikethrough(task.isDone)
                                    .foregroundStyle(task.isDone ? .gray : .primary)
                                
                                Spacer()

                                Button{
                                    isShowingEdit = true
                                    taskBeingEdited = task
                                    editedText = task.title
                                }label: {
                                    Image(systemName: "pencil")
                                        .foregroundStyle(.primary)
                                }
                                
                                Button{
                                    //use removeAll and give the id of the task
                                    tasks.removeAll{ $0.id == task.id }
                                }label: {
                                    Image(systemName: "trash")
                                
                                }
                            }
                        }
                    }
                }
            }
            
            Button("Delete All"){
                tasks.removeAll()
            }
        }
        .padding()
        .alert("Oops no cat", isPresented: $showAlert){
            Button("OK",role: .cancel) {
                
            }
        }message: {
            Text("Please type something before adding.")
        }
        .alert("Editing", isPresented: $isShowingEdit) {
            
            TextField("Task Title", text: $editedText)
            
            Button("Save"){
                if let taskBeingEdited,
                   let index = tasks.firstIndex(where: { $0.id == taskBeingEdited.id}){
                    tasks[index].title = editedText
                }
                taskBeingEdited = nil
            }
            
            Button("Cancel",role: .cancel){
                taskBeingEdited = nil
            }
            
        }
    }
    
   
    
    
}
#Preview {
    ContentView()
}
