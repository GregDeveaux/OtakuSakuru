//
//  AuthentificationViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/03/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthentificationViewModel: ObservableObject {

    let authentification = Auth.auth()
    let firestore = Firestore.firestore()

        // create user account
    func createAccount(withEmail: String, password: String, username: String) {
        authentification.createUser(withEmail: withEmail, password: password) { result, error in
            guard let result = result, error == nil else {
                return print("🛑 AUTHENTIFICATION_VIEW_MODEL/CREATE_USER: Create user failed: \(String(describing: error?.localizedDescription))")
            }

            // and save his username in data according to the userID (used to whole app)
            let userUid = result.user.uid
            print("✅ AUTHENTIFICATION_VIEW_MODEL/CREATE_USER: The user has been create with success: \(userUid)")

            self.firestore.collection("users").addDocument(data: ["id": userUid, "name": username])

        }
    }

        // check if user exist
    func signIn(withEmail: String, password: String) {
        authentification.signIn(withEmail: withEmail, password: password) { result, error in
            guard error == nil else {
                return print("🛑 AUTHENTIFICATION_VIEW_MODEL/SIGN_IN: Sign In failed: \(String(describing: error?.localizedDescription))")
            }
            print("✅ AUTHENTIFICATION_VIEW_MODEL/SIGN_IN: Sign In is a success")
        }
    }


    func authListener() {
        authentification.addStateDidChangeListener { auth, user in
            if user != nil {

            }
        }
    }




}
