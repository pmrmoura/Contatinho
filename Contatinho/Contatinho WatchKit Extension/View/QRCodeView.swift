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
    var qr: UIImage
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                Image(uiImage: qr)
                    .resizable()
                    .scaledToFit()
                    .padding()

                Button(action: {
                    UserDefaults.standard.removeObject(forKey: "encodedImage")
                    self.backFromQRCodeView = true
                    self.presentationMode.wrappedValue.dismiss()
    
                }, label: {
                    Text("Refazer registro")
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .allowsTightening(true)
                })
                .background(Color("alienGreen"))
                .cornerRadius(10.0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationBarHidden(true)
            .onAppear(perform: {
                let data = qr.pngData()
                let imageBase64String = data?.base64EncodedString()
                UserDefaults.standard.set(imageBase64String, forKey: "encodedImage")
                print("salvou")
            })
        }
    }
}
