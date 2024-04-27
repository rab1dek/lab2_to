//
//  ButtonsView.swift
//  lab2_to
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ButtonsView: View {
    @Binding var selectedTheme : String
    @Binding var selectedEmoji : [String]
    @Binding var colour : Color
    let name : String
    let image : String
    
    var body: some View {
        Button(action: {
            selectedTheme = name
            
            switch selectedTheme
            {
            case "Motyw 2":
                selectedEmoji = ["🥵", "🥶", "🥵", "🥶", "💀", "💀", "💩", "💩"].shuffled()
                colour = Color.purple
            case "Motyw 3":
                selectedEmoji = ["🤐", "🥴", "🤢", "🤮", "🤐", "🥴", "🤢", "🤮"].shuffled()
                colour = Color.red
            default:
                selectedEmoji = ["😶‍🌫️", "😤", "😅", "😆", "😶‍🌫️", "😤", "😅", "😆"].shuffled()
                colour = Color.green
            }
        }, label:{VStack {
            Image(systemName: image)
                .font(.system(size: 24))
            Text(name)
                .font(.caption)
        }.foregroundColor(selectedTheme == "Motyw 2" ? .purple : selectedTheme == "Motyw 3" ? .red : .green)})
        
    }
}

#Preview {
    ButtonsView(selectedTheme: .constant("Motyw 1"), selectedEmoji: .constant([]), colour: .constant(Color.green), name: "Motyw 1", image: "face.smiling")
}
