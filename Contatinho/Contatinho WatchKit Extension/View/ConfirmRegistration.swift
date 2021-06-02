//
//  ConfirmRegistration.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 28/05/21.
//

import SwiftUI

struct ConfirmRegistration: View {
    @Environment(\.presentationMode) var presentationMode
    @State var backFromQRCodeView = false
    @State var qrCode: UIImage = UIImage()
    @StateObject var qrCodeViewModel:QRCodeViewModel = QRCodeViewModel()
    
    let contact: Contact

    var body: some View {
        ScrollView{
            VStack {
                Image("alienBG")
                
                Text("TUDO CERTO! CONTATO \((contact.firstName).uppercased()) SELECIONADO.")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("FPDPressure-SemiBold", size: 12))
                
                NavigationLink(
                    destination: QRCodeView(backFromQRCodeView: $backFromQRCodeView, qr: self.qrCode),
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
            if !backFromQRCodeView {
                self.qrCode = UIImage(cgImage: qrCodeViewModel.generateQRCode(contact: contact)!)
            }
        })
    }
}
