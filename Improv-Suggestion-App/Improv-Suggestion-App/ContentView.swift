//
//  ContentView.swift
//  Improv-Suggestion-App
//
//  Created by This on 09/07/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var suggestion = "The MOON"
    
    @State var objects = ["spoon", "mug", "fork", "knife","pan","bowl","shoes","candle","tv","canon"]
  
    @State var locations = ["saloon", "church", "restuarant", "pantry","supermarket","bowling alley","swimming pool","castle","forest","mountain top"]
    
    @State var emotions = ["happy", "sad", "excited", "nervous","jealous","angry","worried","manic","depressed","joyful"]
    
    @State var relationships = ["couple", "sisters", "brothers", "dad and son","man a dog","bookie and gambler","bus driver and passenger","best friends","enemies","strangers"]

    
    var body: some View {
        Spacer()
        Text(suggestion).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Spacer()
        
     
        
        VStack {
            HStack {
                Button("Object") {
                    selectObject()
                }.buttonStyle(CustomizeWithPressed())
                
          
                Button("Location") {
                    selectLocation()
                }.buttonStyle(LocationStyle())
            }
            HStack {
                Button("Emotion") {
                    selectEmotion()
                }.buttonStyle(EmotionStyle())
                Button("Relationship") {
                    selectRelationship()
                }.buttonStyle(RelationshipStyle())
            }
        }
     
        
      
    }
    
    private func selectObject() {
        suggestion = objects[Int.random(in: 0...10)]
    }

    private func selectLocation() {
        suggestion = locations[Int.random(in: 0...10)]
    }
    
    private func selectEmotion() {
        suggestion = emotions[Int.random(in: 0...10)]
    }
    
    private func selectRelationship() {
        suggestion = relationships[Int.random(in: 0...10)]
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    

}

struct CustomizeWithPressed: ButtonStyle {
    typealias Body = Button

    func makeBody(configuration: Self.Configuration)
-> some View {
        if configuration.isPressed {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.white)
                .foregroundColor(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 0))
                .border(Color.black)
                .font(.title2)
        } else {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.cyan)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 0))
                .font(.title2)
              
        }
    }
}

struct LocationStyle: ButtonStyle {
    typealias Body = Button

    func makeBody(configuration: Self.Configuration)
-> some View {
        if configuration.isPressed {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.white)
                .foregroundColor(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 0))
                .border(Color.black)
                .font(.title2)

              
        } else {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.orange)
                .font(.title2)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 0))
        }
    }
}

struct EmotionStyle: ButtonStyle {
    typealias Body = Button

    func makeBody(configuration: Self.Configuration)
-> some View {
        if configuration.isPressed {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.white)
                .font(.title2)
                .foregroundColor(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 0))
                .border(Color.black)

              
        } else {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.indigo)
                .font(.title2)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 0))
              
        }
    }
}

struct RelationshipStyle: ButtonStyle {
    typealias Body = Button

    func makeBody(configuration: Self.Configuration)
-> some View {
        if configuration.isPressed {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.white)
                .font(.title2)
                .foregroundColor(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 0))
                .border(Color.black)

              
        } else {
            return configuration
                .label
                .padding()
                .frame(width: 200, height: 200)
                .background(Color.secondary)
                .font(.title2)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 0))
              
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
      

}
