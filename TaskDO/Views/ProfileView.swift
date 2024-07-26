//
//  ProfileView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading ...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUserData()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image("Avatar")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding(.bottom, 25)
        
        VStack {
            Text("Hello \(viewModel.user?.name ?? "User")")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text(viewModel.user?.email ?? "")
                .font(.subheadline)
                .padding(.bottom, 15)
            
            if let dateJoined = viewModel.user?.joined {
                Text("Joined at \(Date(timeIntervalSince1970: viewModel.user?.joined ?? 0).formatted(date: .abbreviated, time: .complete))")
            }
            
            Text("Its nice having you here.")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
                .padding(.top, 100)
        }
        
        Spacer()
        
        TLButton(title: "Log Out", background: .red) {
            viewModel.logOut()
        }
        .frame(width: UIScreen.main.bounds.width - 100, height: 40)
        .padding(.bottom, 25)
    }
}

#Preview {
    ProfileView()
}
