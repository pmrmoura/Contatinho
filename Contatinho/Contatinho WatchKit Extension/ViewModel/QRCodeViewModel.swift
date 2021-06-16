//
//  QRCodeViewModel.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 01/06/21.
//

import SwiftUI
import EFQRCode

class QRCodeViewModel: ObservableObject {
    func generateQRCode(contact: Contact) -> CGImage? {
        let data: String = "BEGIN:VCARD\nVERSION:3.0\nFN;CHARSET=UTF-8:Pedro Moura\nN;CHARSET=UTF-8:\(contact.lastName);\(contact.firstName);;;\nTEL;TYPE=CELL:\(contact.phone)\nREV:2021-06-01T11:51:12.382Z\nEND:VCARD"
        
        print("entrou")
        
        guard let image = EFQRCode.generate(
                for: data,
                backgroundColor: UIColor.clear.cgColor,
                foregroundColor: UIColor(named: "alienGreen")!.cgColor)
            else {
                print("failed")
                return nil
        }
        
        print("entrou2")
        return image
    }
}
