//
//  ConfirmRegistration.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 28/05/21.
//

import SwiftUI

struct ConfirmRegistration: View {
    @State var name: String
    var body: some View {
        ScrollView{
            VStack {
                Text("Tudo certo")
                    .font(.title3)
                Text("👍")
                    .font(.title2)
                Text("Cartão \(name) registrado.")
                    .multilineTextAlignment(.center)
                NavigationLink(
                    destination: QRCodeView(),
                    label: {
                        Text("Usar QRCode")
                    })
                Button(action: {print("oi")}, label: {
                    Text("Refazer registro")
                })
            }
        }
        .navigationBarHidden(false)
        .padding(.leading)
        .padding(.trailing)
    }
}

//struct ConfirmRegistration_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmRegistration()
//    }
//}
