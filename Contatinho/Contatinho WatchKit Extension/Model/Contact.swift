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
