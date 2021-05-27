//
//  OnboardingView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = ContactViewModel()
    var body: some View {
        VStack {
            Text("Para começar você precisar ter seu cartão registrado no contato")
                .padding()
            Spacer()
            Button(action: {print("dede")}, label: {
                Text("Tenho sim")
            })
            
//            ForEach(viewModel.contacts) { contact in
//                VStack {
//                    Text(contact.firstName)
//                }
//            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
