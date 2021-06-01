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
        VStack {
            Image("alienBG")
            Text("OLÁ TERRAQUEO! COMPARTILHAR CONTATOS NUNCA FOI TÃO FÁCIL...")
                .fixedSize(horizontal: false, vertical: true)
            HStack{
                Spacer(minLength: 100)
                NavigationLink(
                    destination: OnboardingView2(),
                    isActive: $goToOnboarding2,
                    label: {
                        Image("nextButton")
                    })
            }
        }
    }
}

struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}
