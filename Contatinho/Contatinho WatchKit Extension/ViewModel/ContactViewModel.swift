//
//  ContactViewModel.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import Contacts
import Foundation

class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    @Published var permissionErrors: PermissionError? = .none
    
    @Published var authorization = CNContactStore.authorizationStatus(for: .contacts)
    
    func openSettings() {
        self.permissionErrors = .none
    }
    
    public func requestContactAccess() {
        CNContactStore.authorizationStatus(for: .contacts)

        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: { [weak self] success, error in
            guard let self = self else { return }
            switch success {
            case true:
                self.permissions()
            default:
                DispatchQueue.main.async {
                    self.permissionErrors = .userError
                }
            }
        })
    }

    func getAllContacts(_ completion: @escaping(Result<[Contact], Error>) -> Void) {
        var contacts: [Contact] = []
        let container = CNContactStore().defaultContainerIdentifier()
        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: container)
        let descriptor =
        [
            CNContactIdentifierKey,
            CNContactGivenNameKey,
            CNContactFamilyNameKey,
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactPostalAddressesKey
        ]
        as [CNKeyDescriptor]
        let fetchReq = CNContactFetchRequest(keysToFetch: descriptor)
        fetchReq.predicate = predicate
        
        do {
            try CNContactStore().enumerateContacts(with: fetchReq) { con, stop in
                let newContact: Contact = .init(contact: con)
                contacts.append(newContact)
            }
            contacts = contacts.sorted(by: { $0.firstName < $1.firstName})
            completion(.success(contacts))
        } catch {
            print("erro")
            completion(.failure(error))
        }
    }
    
    func permissions() {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            self.getAllContacts { result in
                switch result {
                case .success(let fetchedContacts):
                    DispatchQueue.main.async {
                        self.contacts = fetchedContacts
                    }
                case .failure(_):
                    print("eeror")
                }
            }
        case .notDetermined, .denied, .restricted:
            requestContactAccess()
        @unknown default:
            fatalError()
        }
    }
    
    func getCurrentAuthStatus() -> String {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            return "authorized"
        case .notDetermined, .denied, .restricted:
            return "forbidden"
        @unknown default:
            fatalError()
        }
    }
}
