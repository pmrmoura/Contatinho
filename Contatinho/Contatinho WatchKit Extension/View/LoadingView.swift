//
//  LoadingView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Henrique Spínola de Assis on 02/06/21.
//

import SwiftUI

struct LoadingView: View {
    @State var isLoading: Bool = true
    
    var body: some View {
        if isLoading {
        ProgressView("")
            .progressViewStyle(CircularProgressViewStyle(tint: Color("alienGreen")))
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
