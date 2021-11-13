//
//  TimeConverterView.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 13/11/2021.
//

import SwiftUI

struct TimeConverterView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            TextField(viewModel.textFieldPrompt, text: $viewModel.inputTime)
                .textFieldStyle(.roundedBorder)

            Button(viewModel.convertButtonTitle) {
                viewModel.convert()
            }

            if !viewModel.convertedTime.isEmpty {
                Text(viewModel.convertedTime)
            }
        }
        .padding()
        .alert(viewModel.errorTitle, isPresented: $viewModel.showingError) {
            Button("OK") {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

struct TimeConverterView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConverterView()
    }
}
