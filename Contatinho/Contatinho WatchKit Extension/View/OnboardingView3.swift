//
//  OnboardingView3.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Henrique Spínola de Assis on 01/06/21.
//

import SwiftUI

struct OnboardingView3: View {
    @StateObject var viewModel = ContactViewModel()
    @State var goToSelectContactsView: Bool = false
    
    var body: some View {
        
        VStack {
            Image("alienBG")
            Text("PRONTO PARA FAZER CONTATO?")
                .fixedSize(horizontal: false, vertical: true)
                
            NavigationLink(
                destination: SelectContactsView(viewModel: viewModel),
                isActive: $goToSelectContactsView,
                label: {
                    Text("Começar")
                        .fontWeight(.bold)
                            
                })
                .background(Color("alienGreen"))
                .cornerRadius(10.0)

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

struct OnboardingView3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView3()
    }
}
