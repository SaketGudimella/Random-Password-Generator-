import SwiftUI

struct ContentView: View {
    @State private var password = "Tap to generate password"
    
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .ignoresSafeArea()
            VStack {
                Text(password)
                    .font(.system(size: 24))
                    .padding()
                    .onTapGesture {
                        password = generatePassword()
                    }
                Spacer()
            }
        }
    }
    
    func generatePassword() -> String {
        var password = ""
        for _ in 1...16 {
            let index = Int(arc4random_uniform(UInt32(characters.count)))
            password += String(characters[characters.index(characters.startIndex, offsetBy: index)])
        }
        return password
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

