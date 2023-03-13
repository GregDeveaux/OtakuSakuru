//
//  AuthentificationViewModel.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/03/2023.

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthentificationViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var validatedUser: Bool = false
    @Published var user: User?

    let authentification = Auth.auth()
    let firestore = Firestore.firestore()

        // MARK: - create user account
    func createAccount() async -> Bool {

            // since this call can generate errors, we wrap it in a do/try/catch
        do {
            let authResult = try await authentification.createUser(withEmail: email, password: password)
                // send an email with verification link
            try await authentification.currentUser?.sendEmailVerification()
                // save a auth user
//            authUser = authResult.user

                // next save his username in data according to the userID (used to whole app)
//            user?.name = authResult.user.displayName ?? "Unknow"
//            self.firestore.collection("users").addDocument(data: ["id": userUid, "name": self.username])
            guard let checkEmail = authentification.currentUser?.isEmailVerified else { return false }

            if checkEmail {
                print("✅ AUTHENTIFICATION_VIEW_MODEL/CREATE_ACCOUNT: The user has been create with success: \(authResult.user.uid)")
                return true
            } else {
                print("🛑 AUTHENTIFICATION_VIEW_MODEL/CREATE_ACCOUNT: Check the email user is wrong")
                return false
            }

        }
        catch {
            print("🛑 AUTHENTIFICATION_VIEW_MODEL/CREATE_ACCOUNT: Create user failed: \(error.localizedDescription)")
            return false
        }
    }

        // MARK: - sign in user account
    func signIn() async -> Bool {
            // since this call can generate errors, we wrap it in a do/try/catch
        do {
            let authResult = try await authentification.signIn(withEmail: email, password: password)
            print("✅ AUTHENTIFICATION_VIEW_MODEL/SIGN_IN: Sign In is a success: \(authResult.user.uid)")
            return true
        }
        catch {
            print("🛑 AUTHENTIFICATION_VIEW_MODEL/SIGN_IN: Sign In failed: \(error.localizedDescription)")
            return false
        }
    }

        // MARK: - check if user exist
    func authListener() {
        authentification.addStateDidChangeListener { auth, user in
            if user != nil {

            }
        }
    }


        // MARK: - sign out a user

    func signOut() {
        do {
            try authentification.signOut()
        }
        catch {
            print("🛑 AUTHENTIFICATION_VIEW_MODEL/SIGN_OUT: Sign Out failed: \(error.localizedDescription)")
        }
    }


        // MARK: - delete a user account

    func deleteAccount() async -> Bool {
            // since this call can generate errors, we wrap it in a do/try/catch
        do {
            try await user?.delete()
            return true
        }
        catch {
            print("🛑 AUTHENTIFICATION_VIEW_MODEL/DELETE_ACCOUNT: Delete account failed: \(error.localizedDescription)")
            return false
        }
    }


        // MARK: - receive mail to change password
        //  Documentation: firebase.google.com/docs/auth/ios/manage-users?hl=fr&authuser=0

    func passwordReset() async -> Bool {
        do {
            try await authentification.sendPasswordReset(withEmail: email)
            print("✅ AUTHENTIFICATION_VIEW_MODEL/PASSWORD_RESET: The message to change password has been send with success: \(email)")
            return true
        }
        catch {
            print("🛑 AUTHENTIFICATION_VIEW_MODEL/PASSWORD_RESET: Password reset failed: \(error.localizedDescription)")
            return false
        }
    }
}
