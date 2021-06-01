//
//  ContactViewModel.swift
//  Contatinho WatchKit Extension
//
//  Created by Pedro Moura on 27/05/21.
//

import Contacts

class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    @Published var authorization = CNContactStore.authorizationStatus(for: .contacts)
    
    public func requestContactAccess() {
        CNContactStore.authorizationStatus(for: .contacts)

        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: {success, error in
            self.permissions()
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
        let dede = CNContactFetchRequest(keysToFetch: descriptor)
        dede.predicate = predicate
        
        do {
            try CNContactStore().enumerateContacts(with: dede) { con, stop in
                let pedro: Contact = .init(contact: con)
                contacts.append(pedro)
            }
            contacts = contacts.sorted(by: { $0.firstName < $1.firstName})
            completion(.success(contacts))
        } catch {
            print("erro")
            completion(.failure(error))
        }
        
//        do {
//            let contacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: descriptor)
//            completion(.success(contacts.map{.init(contact: $0)}))
//        } catch {
//            completion(.failure(error))
//        }
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
