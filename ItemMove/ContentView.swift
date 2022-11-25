//
//  ContentView.swift
//  ItemMove
//
//  Created by Oncu Can on 24.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State var item: String = ""
    @State var itemGroup: [String] = []
    
    private func deleteTask(indexset: IndexSet) {
        indexset.forEach { delete in
            itemGroup.remove(at: delete)
        }
    }
    private func moveTask(from source: IndexSet, to destination: Int) {
        itemGroup.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter a Task", text: $item)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add Task") {
                        itemGroup.append(item)
                        item = ""
                    }
                }
                List {
                    ForEach(itemGroup, id: \.self) { index in
                        Text(index)
                    }
                    .onDelete(perform: deleteTask)
                    .onMove(perform: moveTask)
                }
            }.listStyle(.plain)
                .toolbar {
                    EditButton()
                }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
