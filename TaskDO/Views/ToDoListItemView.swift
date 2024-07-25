//
//  ToDoListItemView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel: ToDoListItemViewViewModel
    
    let item: ToDoListItem
    
    init(userID: String, item: ToDoListItem) {
        self._viewModel = StateObject(
            wrappedValue: ToDoListItemViewViewModel(
                userID: userID
            )
        )
        self.item = item
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date:.abbreviated,time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleCheck(item: item)
            } label : {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

#Preview {
    ToDoListItemView(
        userID: "",
        item: ToDoListItem(
            id: UUID().uuidString,
            title: "New ToDo",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        ))
}
