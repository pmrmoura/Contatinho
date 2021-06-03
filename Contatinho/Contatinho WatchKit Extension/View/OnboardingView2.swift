//
//  OnboardingView2.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Henrique Spínola de Assis on 01/06/21.
//

import SwiftUI

struct OnboardingView2: View {
    
    @State var goToOnboarding3: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image("alienBG")
                Text("PARA USAR MINHA TECNOLOGIA SEU WATCH PRECISA ESTAR VINCULADO AO ICLOUD!")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Orbitron-VariableFont_wght.ttf", size: 12))
                    NavigationLink(
                        destination: OnboardingView3(),
                        isActive: $goToOnboarding3,
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

struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}
