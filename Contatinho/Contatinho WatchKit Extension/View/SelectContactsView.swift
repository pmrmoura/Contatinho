//
//  SelectContactsView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import SwiftUI

struct SelectContactsView: View {
    @StateObject var viewModel: ContactViewModel
    var body: some View {
        ScrollView {
            VStack {
                Text("Selecione o contato")
                ForEach(viewModel.contacts, id: \.id) { contact in
                    NavigationLink(
                        destination: ConfirmRegistration(name: contact.firstName),
                        label: {
                            Text(contact.firstName + " " + contact.lastName)
                        }
                    )
                }
            }
        }
        .navigationBarHidden(true)
        .padding(.leading)
        .padding(.trailing)
        .onAppear(perform: {
            self.viewModel.permissions()
        })
    }
}

//struct SelectContactsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectContactsView(viewModel: <#ContactViewModel#>)
//    }
//}
