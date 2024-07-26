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
}

#Preview {
    ToDoListView(userID: "")
}
