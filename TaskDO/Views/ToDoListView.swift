//
//  ToDoListItemsView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI
import FirebaseAuth

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome back")
                
            }
            .navigationTitle("ToDos")
            .toolbar {
                Button {
                    viewModel.showNewItemView = !viewModel.showNewItemView
                } label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showNewItemView) {
                NewItemView(newItemPresented: $viewModel.showNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "")
}
