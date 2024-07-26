//
//  ToDoListItemsView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userID: String
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(
                userID: userID
            )
        )
        self.userID = userID
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if items.count == 0 {
                    HStack {
                        Text("Add tasks using")
                        Image(systemName:"plus")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 20, height: 20)
                        Text("from top right corner")
                    }
                } else {
                    getLists()
                }
            }
            .contentMargins(.top, 20)
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
    
    @ViewBuilder
    func getLists() -> some View {
        List {
            Section(header: Text("Upcoming")) {
                ForEach(items.filter { $0.isDone == false } ) { item in
                    ToDoListItemView(userID: userID, item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                }
            }
            Section(header: Text("Cleared")) {
                ForEach(items.filter { $0.isDone == true }) { item in
                    ToDoListItemView(userID: userID, item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "")
}
