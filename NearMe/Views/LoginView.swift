import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String? = nil
    @State private var isLoggedIn: Bool = false

    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            NavigationView {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                        .padding(.top, 50)

                    TextField("Correo electrónico", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .padding(.horizontal)

                    SecureField("Contraseña", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .padding(.horizontal)

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }

                    Button(action: signIn) {
                        Text("Iniciar sesión")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    NavigationLink(destination: SignUpView()) {
                        Text("Registrarse")
                            .foregroundColor(.blue)
                            .padding(.top, 20)
                    }

                    NavigationLink(destination: ResetPasswordView()) {
                        Text("¿Olvidaste tu contraseña?")
                            .foregroundColor(.blue)
                            .padding(.top, 20)
                    }

                    Spacer()
                }
                .navigationBarTitle("Iniciar sesión", displayMode: .inline)
            }
        }
    }

    private func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
