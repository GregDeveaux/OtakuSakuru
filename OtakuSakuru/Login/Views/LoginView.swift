//
//  LoginView.swift
//  OtakuSakuru
//
//  Created by Greg-Mini on 05/03/2023.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = AuthentificationViewModel()

    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    @State private var visible: Bool = false

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
                    Text("Bienvenue")
                        .font(.title)
                        .foregroundColor(.white)
                        .opacity(appear ? 1 : 0)
                        .animation(.easeInOut(duration: 2).delay(1.35), value: appear)

                    TextField("Nom d'utilisateur",
                              text: $username,
                              prompt: Text("Nom d'utilisateur").foregroundColor(.white))
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 45, alignment: .center)
                        .onSubmit {
                                //                            validate(name: username)
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

                    TextField("Adresse mail",
                              text: $email,
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
                                        text: $password,
                                        prompt: Text("Mot de passe").foregroundColor(.white))
                        } else {
                            TextField("Mot de passe",
                                      text: $password,
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

                    Button {
                        viewModel.createUser(withEmail: email, password: password)
                    } label: {
                        Text("S'enregister")
                            .foregroundColor(appear ? .white : .indigoJapan)
                            .frame(width: 300, height: 45, alignment: .center)
                            .background(Color.indigoJapan)
                            .cornerRadius(15)
                            .animation(.easeInOut(duration: 2).delay(0.4), value: appear)
                    }
                    .padding(15)
                    .opacity(appear ? 1 : 0)
                    .animation(.easeInOut(duration: 2).delay(0.2), value: appear)

                    Button {

                    } label: {
                        Text("Mot de passe oublié ?")
                            .font(.system(size: 15))
                            .fontWeight(.thin)
                            .foregroundColor(.white)
                    }
                    .padding(.top, -10)


                }
                .position(x: proxy.size.width / 2,
                          y: proxy.size.height / 1.8)
                .onSubmit {
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
