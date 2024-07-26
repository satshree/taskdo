//
//  MainView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn
           , !viewModel.currentUserId.isEmpty
        {
            accountView
        } else {
            NavigationView {
                LoginView()
            }
        }
            
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userID: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
