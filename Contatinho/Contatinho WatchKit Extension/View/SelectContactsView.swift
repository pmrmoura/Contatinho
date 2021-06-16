//
//  SelectContactsView.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import SwiftUI

struct SelectContactsView: View {
    @StateObject var viewModel: ContactViewModel
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State var qrCodeSaved: UIImage = UIImage()
    @State var hasQRCode: Bool = false
    @State var auxBool = false
    var body: some View {
        ScrollView {
            VStack {
                Text("Selecione o contato")
                    .lineLimit(1)
                    .allowsTightening(true)

                if viewModel.contacts.count > 0 {
                    LazyVStack {
                        ForEach(viewModel.contacts) { contact in
                            ZStack {
                                NavigationLink(
                                    destination: ConfirmRegistration(contact: contact),
                                    label: {
                                        Text(contact.firstName + " " + contact.lastName)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                    }
                                )
                                if self.hasQRCode {
                                    NavigationLink(
                                        destination: QRCodeView(backFromQRCodeView: $auxBool, qr: self.qrCodeSaved),
                                        isActive: $hasQRCode,
                                        label: {
                                            Text(contact.firstName + " " + contact.lastName)
                                        }
                                    )
                                }
                            }
                        }
                    }
                }
                else {
                    VStack {
                        Text("Nenhum contato disponível")
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .padding(.leading)
        .padding(.trailing)
        .onAppear(perform: {
            self.viewModel.permissions()

            if let imageBase64String = UserDefaults.standard.value(forKey: "encodedImage"),
               let url = URL(string: String(format:"data:application/octet-stream;base64,%@",imageBase64String as! CVarArg))
            {
                do
                {
                    let data =  try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    self.qrCodeSaved = image!
                    self.hasQRCode = true
                    
                }
                catch let error
                {
                    print(error)
                }
            }
        })
    }
}
