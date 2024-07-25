//
//  ToDoListItemView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item: ToDoListItem
    
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
                Image(systemName: item.isDone ? "circle.checkmark.fill" : "circle")
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: UUID().uuidString,
        title: "New ToDo",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
