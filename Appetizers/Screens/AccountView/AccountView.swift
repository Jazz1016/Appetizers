//
//  AccountView.swift
//  Appetizers
//
//  Created by James Lea on 5/21/23.
//

import SwiftUI

struct AccountView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var birthdate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    
                    Button {
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }
                    
                }
            }
            .navigationTitle("Account 🤣")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
