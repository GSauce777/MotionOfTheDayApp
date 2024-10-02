import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            Text("This app is designed to help you pick a random Motion of the Day to keep you moving!")
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(4 / 5, contentMode: .fit) 
                
                ZStack {
                    Image("gabriel_shot")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 425, maxHeight: 425)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Text("App Developed by Gabriel Saucedo")
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding()
            
            Text("2024")
                .multilineTextAlignment(.center)
                .font(.headline)
                .offset(y: -10)
            
            Text("This is the first app I have ever coded. Thank you for taking a look.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
    }
}
