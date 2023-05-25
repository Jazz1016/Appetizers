//
//  AccountView.swift
//  Appetizers
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextField, equals: .firstName)
                        .onSubmit { focusTextField = .lastName }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit { focusTextField = .email }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextField, equals: .email)
                        .onSubmit { focusTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusTextField = nil }
                }
            }
            .navigationTitle("Account 🤣")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
