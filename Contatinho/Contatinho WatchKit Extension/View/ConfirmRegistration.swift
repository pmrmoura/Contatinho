//
//  ConfirmRegistration.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 28/05/21.
//

import SwiftUI

struct ConfirmRegistration: View {
    @Environment(\.presentationMode) var presentationMode
    let contact: Contact
    @State var backFromQRCodeView = false
    var body: some View {
        ScrollView{
            VStack {
                Text("Tudo certo")
                    .font(.title3)
                
                Text("👍")
                    .font(.title2)
                
                Text("Cartão \(contact.firstName) selecionado.")
                    .multilineTextAlignment(.center)
                
                NavigationLink(
                    destination: QRCodeView(backFromQRCodeView: $backFromQRCodeView, contact: contact),
                    label: {
                        Text("Usar QRCode")
                    })
                    .padding()
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .onAppear(perform: {
            if (backFromQRCodeView) {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}
