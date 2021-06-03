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
        ScrollView {
            VStack {
                Image("alienBG")

                Text("PRONTO PARA FAZER CONTATO?")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Orbitron-VariableFont_wght.ttf", size: 12))
                    
                NavigationLink(
                    destination: SelectContactsView(viewModel: viewModel),
                    isActive: $goToSelectContactsView,
                    label: {
                        Text("Começar")
                            .fontWeight(.bold)
                                
                    })
                    .background(Color("alienGreen"))
                    .cornerRadius(10.0)

            }
            .onAppear(perform: {
                switch viewModel.getCurrentAuthStatus() {
                case "authorized":
                    goToSelectContactsView = true
                default:
                    goToSelectContactsView = false
                }
            })
            .alert(item: $viewModel.permissionErrors) { _ in
                Alert(title: Text(viewModel.permissionErrors?.description ?? "Unknown"), message: Text(""))
            }
        }
    }
}

struct OnboardingView3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView3()
    }
}
