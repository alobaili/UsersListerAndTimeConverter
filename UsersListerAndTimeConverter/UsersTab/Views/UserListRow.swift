//
//  UserListRow.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 12/11/2021.
//

import SwiftUI

struct UserListRow: View {
    let user: User

    var body: some View {
        Label {
            Text(user.name)
                .padding(.leading, 4)
        } icon: {
            AsyncImage(url: URL(string: user.profileImage.large)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, .gray)
                } else {
                    ProgressView()
                }
            }
            .frame(width: 44, height: 44)
            .clipShape(Circle())
        }
    }
}

struct UserListRow_Previews: PreviewProvider {
    static var previews: some View {
        UserListRow(user: .example)
    }
}
