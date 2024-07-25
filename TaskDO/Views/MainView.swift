//
//  MainView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI

struct MainView: View {
    @State var viewModel = MainViewViewModel()
    
//    init() {
//        print("INIT MAIN", viewModel.isSignedIn, viewModel.currentUserId)
//    }
//    
    var body: some View {
        NavigationView{
            if viewModel.isSignedIn
//                , !viewModel.currentUserId.isEmpty
            {
                ToDoListView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
