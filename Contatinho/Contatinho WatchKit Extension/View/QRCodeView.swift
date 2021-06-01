//
//  QRCodeView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 28/05/21.
//

import SwiftUI
import Contacts

struct QRCodeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var backFromQRCodeView: Bool
    let contact: Contact
    @StateObject var viewModel: QRCodeViewModel = QRCodeViewModel()
    var body: some View {
        VStack {
            
            Image(viewModel.generateQRCode(contact: contact)!, scale: 2.0, orientation: .up, label: Text("oi"))
                .resizable()
                .scaledToFit()
                .padding()

            Button(action: {
                self.backFromQRCodeView = true
                self.presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("Refazer registro")
            })
            .padding()
        }
        .navigationBarHidden(true)
    }
}
