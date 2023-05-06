import SwiftUI
import Firebase

@main
struct NearMeApp: App {
    @State private var showSplash = true
    
    init() {
        FirebaseApp.configure() // Agrega esta línea
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashView()
                } else {
                    LoginView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        showSplash = false
                    }
                }
            }
        }
    }
}
