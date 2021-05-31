//
//  QRCodeView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 28/05/21.
//

import SwiftUI

struct QRCodeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var backFromQRCodeView: Bool
    var body: some View {
        VStack {
            Image("qrcodetest")
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

//struct QRCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        QRCodeView()
//    }
//}
