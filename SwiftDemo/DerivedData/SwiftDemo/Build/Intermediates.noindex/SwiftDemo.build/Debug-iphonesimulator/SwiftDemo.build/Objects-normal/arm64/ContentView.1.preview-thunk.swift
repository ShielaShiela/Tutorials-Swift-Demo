import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/shielacabahug/Downloads/Tutorials-Swift-Demo/SwiftDemo/SwiftDemo/ContentView.swift", line: 1)
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
                TextField(__designTimeString("#10054_0", fallback: "New Task"),text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Button(__designTimeString("#10054_1", fallback: "Add"))
                {
                    if text.isEmpty {
                        showAlert = __designTimeBoolean("#10054_2", fallback: true)
                    } else {
                        tasks.append(TodoItem(title: text))
                        text = __designTimeString("#10054_3", fallback: "")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            
            List {
                LazyVStack (alignment: .leading, spacing: __designTimeInteger("#10054_4", fallback: 20)) {
                    ForEach($tasks) { $task in
                        Button {
                            task.isDone.toggle()
                        } label: {
                            HStack {
                                Image(systemName: task.isDone ? __designTimeString("#10054_5", fallback: "checkmark.circle.fill") : __designTimeString("#10054_6", fallback: "circle"))
                                    .foregroundStyle(task.isDone ? .green : .gray)
                                
                                Text(task.title)
                                    .strikethrough(task.isDone)
                                    .foregroundStyle(task.isDone ? .gray : .primary)
                                
                                Spacer()

                                Button{
                                    isShowingEdit = __designTimeBoolean("#10054_7", fallback: true)
                                    taskBeingEdited = task
                                    editedText = task.title
                                }label: {
                                    Image(systemName: __designTimeString("#10054_8", fallback: "pencil"))
                                        .foregroundStyle(.primary)
                                }
                                
                                Button{
                                    //use removeAll and give the id of the task
                                    tasks.removeAll{ $0.id == task.id }
                                }label: {
                                    Image(systemName: __designTimeString("#10054_9", fallback: "trash"))
                                
                                }
                            }
                        }
                    }
                }
            }
            
            Button(__designTimeString("#10054_10", fallback: "Delete All")){
                tasks.removeAll()
            }
        }
        .padding()
        .alert(__designTimeString("#10054_11", fallback: "Oops no cat"), isPresented: $showAlert){
            Button(__designTimeString("#10054_12", fallback: "OK"),role: .cancel) {
                
            }
        }message: {
            Text(__designTimeString("#10054_13", fallback: "Please type something before adding."))
        }
        .alert(__designTimeString("#10054_14", fallback: "Editing"), isPresented: $isShowingEdit) {
            
            TextField(__designTimeString("#10054_15", fallback: "Task Title"), text: $editedText)
            
            Button(__designTimeString("#10054_16", fallback: "Save")){
                if let taskBeingEdited,
                   let index = tasks.firstIndex(where: { $0.id == taskBeingEdited.id}){
                    tasks[index].title = editedText
                }
                taskBeingEdited = nil
            }
            
            Button(__designTimeString("#10054_17", fallback: "Cancel"),role: .cancel){
                taskBeingEdited = nil
            }
            
        }
    }
    
   
    
    
}
#Preview {
    ContentView()
}
