//
//  QRCodeView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 28/05/21.
//

import SwiftUI

struct QRCodeView: View {
    var body: some View {
        VStack {
            Image("qrcodetest")
                .resizable()
                .scaledToFit()
                .padding(.bottom)

            Button(action: {print("oi")}, label: {
                Text("Refazer registro")
            })
        }
        .navigationBarHidden(true)
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
