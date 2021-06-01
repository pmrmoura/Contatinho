//
//  Contact.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import Contacts

struct Contact: Identifiable {
    var id: String { contact.identifier }
    var firstName: String { contact.givenName }
    var lastName: String { contact.familyName }
    var phone: String { contact.phoneNumbers.map(\.value).first!.stringValue }
    let contact: CNContact
}

enum PermissionError: Identifiable {
    var id: String { UUID().uuidString }
    case userError
    case fetchError(_: Error)
    var description: String {
        switch self {
        case .userError:
            return "Permita o nosso acesso aos contatos nos ajustes"
        case .fetchError(let error):
            return error.localizedDescription
        }
    }
}
