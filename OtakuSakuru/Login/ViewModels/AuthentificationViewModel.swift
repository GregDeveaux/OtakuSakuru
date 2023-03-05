//
//  AuthentificationViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/03/2023.
//

import Foundation
import FirebaseAuth

class AuthentificationViewModel: ObservableObject {

    func createUser(withEmail: String, password: String) {
        Auth.auth().createUser(withEmail: withEmail, password: password) { result, error in
            if let error = error, result == nil {
                print("🛑 AUTHENTIFICATION_VIEW_MODEL/CREATE_USER: Create user failed: \(error.localizedDescription)")
            }
            print("✅ AUTHENTIFICATION_VIEW_MODEL/CREATE_USER: Create user is a success")
        }
    }


    func signIn(withEmail: String, password: String) {
        Auth.auth().signIn(withEmail: withEmail, password: password) { result, error in
            if let error = error, result == nil {
                print("🛑 AUTHENTIFICATION_VIEW_MODEL/SIGN_IN: Sign In failed: \(error.localizedDescription)")
            }
            print("✅ AUTHENTIFICATION_VIEW_MODEL/SIGN_IN: Sign In is a success")
        }
    }







}
