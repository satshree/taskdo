//
//  RegisterView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "TaskDO",
                subTitle: "Create new account"
            )
        
            Form {
                VStack{
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .padding(.top, 5)
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.top, 5)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 5)
                    
                    TLButton(
                        title: "Sign Up",
                        background: .green
                    ) {
                        viewModel.register()
                    }
                    .padding(.top, 25)
                    .padding(.bottom, 5)
                }
            }
        }
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
