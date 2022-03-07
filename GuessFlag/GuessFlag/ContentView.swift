//
//  ContentView.swift
//  GuessFlag
//
//  Created by Phát Nguyễn on 06/03/2022.
//

import SwiftUI

struct ContentView: View {
    private var countries = ["france", "germany", "uk", "us"]
    var correctAns = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Guess the correct flag")
                        .foregroundColor(.white)
                    Text("\(countries[correctAns].capitalizingFirstLetter())")
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        // flag was tapped
                    } label: {
                        Image(countries[number]).renderingMode(.original)
                    }
                }
            }
        }
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
