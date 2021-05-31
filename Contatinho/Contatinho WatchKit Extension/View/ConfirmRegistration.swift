//
//  ConfirmRegistration.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 28/05/21.
//

import SwiftUI

struct ConfirmRegistration: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String
    @State var backFromQRCodeView = false
    var body: some View {
        ScrollView{
            VStack {
                Text("Tudo certo")
                    .font(.title3)
                
                Text("👍")
                    .font(.title2)
                
                Text("Cartão \(name) selecionado.")
                    .multilineTextAlignment(.center)
                
                NavigationLink(
                    destination: QRCodeView(backFromQRCodeView: $backFromQRCodeView),
                    label: {
                        Text("Usar QRCode")
                    })
                    .padding()
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
