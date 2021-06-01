//
//  OnboardingView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = ContactViewModel()
    @State var auth = ""
    var body: some View {
        ZStack {
            if auth == "" {
                OnboardingView1()
            } else {
                OnboardingView3()
            }
        }.onAppear(perform: {
            switch viewModel.getCurrentAuthStatus() {
            case "authorized":
                auth = "authorized"
            default:
                auth = ""
            }
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
