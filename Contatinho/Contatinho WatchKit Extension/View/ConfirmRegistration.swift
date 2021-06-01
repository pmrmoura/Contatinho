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
                    Image("alienBG")
                    Text("TUDO CERTO! CONTATO \(contact.firstName) SELECIONADO.")
                        .fixedSize(horizontal: false, vertical: true)
                    HStack{
                        Spacer(minLength: 100)
                        NavigationLink(
                            destination: QRCodeView(backFromQRCodeView: $backFromQRCodeView, contact: contact),
                            label: {
                                Image("nextButton")
                            })
                    }
                }
                
        }
        .navigationBarHidden(false)
        .padding(.leading)
        .padding(.trailing)
        .onAppear(perform: {
            if (backFromQRCodeView) {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

//struct ConfirmRegistration_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmRegistration()
//    }
//}
