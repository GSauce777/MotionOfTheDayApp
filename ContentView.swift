import SwiftUI

struct ContentView: View {
    var begin = ["Ready?"]
    
    var motions = ["Air Squats", "Bicycle Kicks", "Bird Dog Stretch", "Shadow Boxing", "Box Step Ups", "Calf Stretch", "Child's Pose", "Flutter Kicks", "Handstand", "High Kicks", "High Knees", "Jumping Jacks", "Lateral Leg Stretch", "Lunges", "Meditate", "Mountain Climbers", "Plank", "Power Walk", "Push Ups", "Run", "Russian Twists", "Seated Hamstrings Leg Stretch", "Side Bend Stretch", "Side Plank", "Sit Ups", "Standing Quadricep Stretch", "Standing Toe Touch", "Toe Touch Crunch", "Tree Pose", "Wall Sit"]
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red, .teal, .yellow]
    
    @State private var selected = "Ready?"
    @State private var id = 1
    @State private var isFirstPress = true

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Motion of the Day")
                        .font(Font.custom("Bumbbled", size: 40, relativeTo: .title))
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .center)
                    
                    Spacer()

                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.black)
                            .frame(maxWidth: 375, maxHeight: 625)
                          
                      
                        
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colors.randomElement() ?? .blue)
                                .frame(maxWidth: 320, maxHeight: 575)
                                .overlay(
                                    Image(selected.replacingOccurrences(of: " ", with: "_"))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 400, maxHeight: 500)
                                )
                            Text("\(selected)")
                                .padding(.top, 20)
                                .foregroundColor(.white)
                                .font(.system(size: 35).bold())
                                .multilineTextAlignment(.center)
                                .offset(y: 175)
                        }
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .push(from: .leading)))
                        .id(id)
                    }

                    Spacer()

                    Button("New Motion!") {
                        withAnimation(.easeInOut(duration: 1)) {
                            var newSelection: String
                            repeat {
                                newSelection = motions.randomElement() ?? "Plank"
                            } while newSelection == selected
                            selected = newSelection
                            id += 1
                        }
                    }
                    .font(.system(size: 24))
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom, 10)
                }
                
                NavigationLink(destination: InfoView()) {
                    Image(systemName: "info.circle")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .position(x: UIScreen.main.bounds.width - 40, y: 15)
            }
        }
    }
}

#Preview {
    ContentView()
}
