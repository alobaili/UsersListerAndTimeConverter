//
//  UsersList.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 10/11/2021.
//

import SwiftUI

struct UsersList: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        List(viewModel.users) { user in
            UserListRow(user: user)
        }
        .task { await viewModel.getUsers() }
        .alert(viewModel.errorTitle, isPresented: $viewModel.showingError) {
            Button(viewModel.alertRetryButtonTitle) {
                Task { await viewModel.getUsers() }
            }
        } message: {
            Text(viewModel.errorMessage)
        }
        
    }
}

struct UsersList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UsersList()
        }
    }
}
