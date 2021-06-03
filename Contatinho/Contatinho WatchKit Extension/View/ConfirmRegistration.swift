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
                    Text("TUDO CERTO! CONTATO \((contact.firstName).uppercased()) SELECIONADO.")
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Orbitron-VariableFont_wght.ttf", size: 12))
                        NavigationLink(
                            destination: QRCodeView(backFromQRCodeView: $backFromQRCodeView, contact: contact),
                            label: {
                                Text("Usar QRCode")
                                    .fontWeight(.bold)
                                        
                            })
                            .background(Color("alienGreen"))
                            .cornerRadius(10.0)
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
