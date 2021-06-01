//
//  SelectContactsView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import SwiftUI

struct SelectContactsView: View {
    @StateObject var viewModel: ContactViewModel
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    var body: some View {
        ScrollView {
            VStack {
                Text("Selecione o contato")

                LazyVStack {
                    ForEach(viewModel.contacts) { contact in
                        ZStack {
                            NavigationLink(
                                destination: ConfirmRegistration(contact: contact),
                                label: {
                                    Text(contact.firstName + " " + contact.lastName)
                                }
                            )
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
