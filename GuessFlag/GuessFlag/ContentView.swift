//
//  ContentView.swift
//  GuessFlag
//
//  Created by Phát Nguyễn on 06/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScores = false
    @State private var scoreTitle = ""
    @State private var countries = ["france", "germany", "uk", "us"].shuffled()
    @State private var correctAns = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.mint, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guest the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text("\(countries[correctAns].capitalizingFirstLetter())")
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                        } label: {
                            Image(countries[number]).renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Scores: ???")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScores) {
            Button("Continue", action: askQuestion)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAns {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScores = true
    }
    
    func askQuestion() {
        // reset the question
        countries.shuffled()
        correctAns = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
