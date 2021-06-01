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
        VStack {
            Image("alienBG")
            Text("PARA USAR MINHA TECNOLOGIA SEU WATCH PRECISA ESTAR VINCULADO AO ICLOUD!")
                .fixedSize(horizontal: false, vertical: true)
            HStack{
                Spacer(minLength: 100)
                NavigationLink(
                    destination: OnboardingView3(),
                    isActive: $goToOnboarding3,
                    label: {
                        Image("nextButton")
                    })
            }
        }
    }
}

struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}
