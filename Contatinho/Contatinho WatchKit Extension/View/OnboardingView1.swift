//
//  OnboardingView1.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Henrique Spínola de Assis on 01/06/21.
//

import SwiftUI

struct OnboardingView1: View {
    @State var goToOnboarding2: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image("alienBG")
                Text("OLÁ TERRAQUEO! COMPARTILHAR CONTATOS NUNCA FOI TÃO FÁCIL...")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Orbitron-VariableFont_wght.ttf", size: 12))
                NavigationLink(
                    destination: OnboardingView2(),
                    isActive: $goToOnboarding2,
                    label: {
                        Text("Continuar")
                            .fontWeight(.bold)
                                
                    })
                    .background(Color("alienGreen"))
                    .cornerRadius(10.0)
            }
        }
    }
}

struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}
