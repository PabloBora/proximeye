import SwiftUI

struct SplashView: View {
    @State private var logoScale: CGFloat = 0.5
    @State private var showLogo = false
    @State private var backgroundColor = Color.green.opacity(0.3)
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .scaleEffect(logoScale)
                    .opacity(showLogo ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showLogo)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                logoScale = 1
                                showLogo = true
                                backgroundColor = Color.green.opacity(0.6)
                            }
                        }
                    }
                Text("Proximeye")
                    .font(Font.system(size: 40, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
