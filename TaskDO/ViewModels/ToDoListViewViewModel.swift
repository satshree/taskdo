//
//  ToDoListViewViewModel.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import Foundation
import FirebaseFirestore

// ViewModel for list of items
class ToDoListViewViewModel: ObservableObject {
    @Published var showNewItemView = false
    
    private let userID: String
    private let db = Firestore.firestore()
    
    init(userID: String) {
        self.userID = userID
    }
    
    
    func delete(id: String) {
        self.db
            .collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
