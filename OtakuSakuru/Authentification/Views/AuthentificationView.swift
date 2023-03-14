//
//  AuthentificationView.swift
//  OtakuSakuru
//
//  Created by Greg Deveaux on 05/03/2023.
//

import SwiftUI
import Combine
import FirebaseAnalyticsSwift

struct AuthentificationView: View {

    @ObservedObject var viewModel = AuthentificationViewModel()

        // for password
    @State private var visible: Bool = false
        // to login version or register version
    @State private var newUser: Bool = false

        // for animation
    @State private var appear: Bool = false

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                    // use lightmode or darkmode Background on the all screen
                Color.otakuBackgroundPrimary.ignoresSafeArea()

                LogoWithHalo()
                    .position(x: proxy.size.width / 2,
                              y: proxy.size.height / 2)
                    .offset(x: 0, y: appear ? -proxy.size.height * 0.31 : 0)
                    .animation(.easeInOut(duration: 2), value: appear)
                    .onAppear {
                        appear = true
                    }


                VStack(alignment: .center, spacing: 10) {
                    welcomeText

                    if newUser {
                        TextField("Nom d'utilisateur",
                                  text: $viewModel.username,
                                  prompt: Text("Nom d'utilisateur").foregroundColor(.white))
                            .foregroundColor(.white)
                            .disableAutocorrection(true)
                            .frame(width: 300, height: 45, alignment: .center)
                            .onSubmit {
                                    // validate(name: username)
                            }
                            .opacity(appear ? 1 : 0)
                            .animation(.easeInOut(duration: 2).delay(1.15), value: appear)

                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 300, height: 1, alignment: .center)
                            .foregroundColor(.white)
                            .padding(.trailing, 30)
                            .padding(.leading, 30)
                            .opacity(appear ? 1 : 0)
                            .animation(.easeInOut(duration: 2).delay(0.95), value: appear)
                    }

                    TextField("Adresse mail",
                              text: $viewModel.email,
                              prompt: Text("Adresse mail").foregroundColor(.white))
                        .keyboardType(.emailAddress)
                        .frame(width: 300, height: 45, alignment: .center)
                        .opacity(appear ? 1 : 0)
                        .animation(.easeInOut(duration: 2).delay(0.85), value: appear)

                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 300, height: 1, alignment: .center)
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .padding(.leading, 30)
                        .opacity(appear ? 1 : 0)
                        .animation(.easeInOut(duration: 2).delay(0.65), value: appear)

                    VStack {
                        if !visible {
                            SecureField("Mot de passe",
                                        text: $viewModel.password,
                                        prompt: Text("Mot de passe").foregroundColor(.white))
                        } else {
                            TextField("Mot de passe",
                                      text: $viewModel.password,
                                      prompt: Text("Mot de passe").foregroundColor(.white))
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 45, alignment: .center)
                    .overlay(alignment: .trailing) {
                        Button {
                            visible.toggle()
                        } label: {
                            Image(systemName: visible ? "eye.slash.fill" : "eye.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 18)
                        }
                    }
                    .opacity(appear ? 1 : 0)
                    .animation(.easeIn(duration: 2).delay(0.45), value: appear)

                    registerOrLogInButton

                    createAccountButton
                    
                    forgetPasswordButton
                }
                .position(x: proxy.size.width / 2,
                          y: proxy.size.height / 1.5)
                .onSubmit {
                }
            }
        }
    }

    var welcomeText: some View {
        Text(newUser ? "Crée ton compte" : "")
            .font(.system(size: 21.5))
            .fontWeight(.medium)
            .fontDesign(.rounded)
            .foregroundColor(.white)
            .padding()
            .opacity(appear ? 1 : 0)
            .animation(.easeInOut(duration: 2).delay(1.35), value: appear)
    }

    var registerOrLogInButton: some View {
        Button {
            if newUser {
                Task {
                    await viewModel.createAccount()
                }
            } else {
                Task {
                    await viewModel.signIn()
                }
            }
        } label: {
            Text(newUser ? "S'enregister" : "Se connecter")
                .fontWeight(.medium)
                .foregroundColor(appear ? .white : .indigoJapan)
                .frame(width: 300, height: 35, alignment: .center)
                .animation(.easeInOut(duration: 2).delay(0.4), value: appear)
        }
        .buttonStyle(.borderedProminent)
        .cornerRadius(15)
        .tint(Color.indigoJapan)
        .padding(15)
        .opacity(appear ? 1 : 0)
        .animation(.easeInOut(duration: 2).delay(0.2), value: appear)
    }

    var createAccountButton: some View {
        Button {
            newUser.toggle()
        } label: {
            Text("Créer un compte")
                .fontWeight(.medium)
                .frame(width: 300, height: 35, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.5)
        }
        .buttonStyle(.bordered)
        .tint(Color.indigoJapan)
        .cornerRadius(15)
        .padding(.top, -10)
        .opacity(newUser ? 0 : 1)
    }

    var forgetPasswordButton: some View {
        Button {
            Task {
                await viewModel.passwordReset()
            }
        } label: {
            Text("Mot de passe oublié ?")
                .font(.system(size: 15))
                .fontWeight(.thin)
                .foregroundColor(.white)
        }
        .padding(5)
        .opacity(newUser ? 0 : 1)
    }
}

struct AuthentificationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthentificationView()
    }
}
