import SwiftUI

 struct ContentView: View {
     @State var emojis = ["😶‍🌫️", "😤", "😅", "😆", "😶‍🌫️", "😤", "😅", "😆"].shuffled()
     @State var selectedTheme = "Motyw 1"
     @State var colour = Color.green

     var body: some View {
         VStack {
             Text("Memo")
                 .font(.largeTitle)
             
             ScrollView{
                 cardDisplay
             }
             buttony
         }
         .padding()
     }
     var buttony: some View {
         HStack {
             ButtonsView(selectedTheme: $selectedTheme, selectedEmoji: $emojis, colour: $colour, name: "Motyw 1", image: "face.smiling")
             Spacer()
             ButtonsView(selectedTheme: $selectedTheme, selectedEmoji: $emojis, colour: $colour, name: "Motyw 2", image: "ellipses.bubble")
             Spacer()
             ButtonsView(selectedTheme: $selectedTheme, selectedEmoji: $emojis, colour: $colour, name: "Motyw 3", image: "camera.rotate")
         }
     }
     var cardDisplay : some View {
         LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
             ForEach(0..<emojis.count, id: \.self){ index in
                 CardView(content: emojis[index], hidden: false)
             }
         }.foregroundColor(colour)
     }

//     var cardAdd: some View {
//         adjustCardNumber(by: 2, symbol: "+")
//     }
//
//     var cardRemove : some View {
//         adjustCardNumber(by: -2, symbol: "-")
//     }
//
//     var cardsAdjusterView : some View{
//         HStack{
//             cardRemove
//             Spacer()
//             cardAdd
//         }
//     }
//
//     func adjustCardNumber(by offset: Int, symbol: String) -> some View{
//         let newCounter = cardsCounter + offset
//         if(symbol == "+"){
//             return Button(action: {
//                 if newCounter >= 0 && newCounter <= emojis.count {
//                    cardsCounter = newCounter
//                 }
//             }){
//                 Image(systemName: "plus.app").font(.largeTitle)
//             }.disabled(cardsCounter >= emojis.count)
//         }
//             return Button(action: {
//                 if newCounter >= 0 && newCounter <= emojis.count {
//                    cardsCounter = newCounter
//                 }
//             }){
//                 Image(systemName: "minus.square").font(.largeTitle)
//             }.disabled(cardsCounter <= 0)
//         }
     }


#Preview {
    ContentView()
}
