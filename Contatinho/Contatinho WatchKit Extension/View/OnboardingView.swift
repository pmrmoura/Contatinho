//
//  OnboardingView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = ContactViewModel()
    @State var goToSelectContactsView: Bool = false
    var body: some View {
        VStack {
            Text("Para começar você precisar ter seu cartão registrado no contato")
                .padding()
            Spacer()

            NavigationLink(
                destination: SelectContactsView(viewModel: viewModel),
                isActive: $goToSelectContactsView,
                label: {
                        Text("Tenho sim")
                })

        }.onAppear(perform: {
            switch viewModel.getCurrentAuthStatus() {
            case "authorized":
                goToSelectContactsView = true
            default:
                goToSelectContactsView = false
            }
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
