//
//  ToDoListItemViewViewModel.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import Foundation
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    func toggleCheck(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        let db = Firestore.firestore()
        db
            .collection("users")
            .document(userID)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictionary())
    }
}
