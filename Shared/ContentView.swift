//
//  ContentView.swift
//  Shared
//
//  Created by Omotayo on 18/02/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    init(store: SandwichStore) {
        self.store = store
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle(Text("Sandwiches"))
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: makeSandwich)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(.init(name: "Patty melt", ingredientCount: 3))
        }
    }
    
    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
            .preferredColorScheme(.dark)
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            HStack {
                Image(sandwich.thumbnailName)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44.0, height: 44.0)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(sandwich.name)
                    Text("\(sandwich.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
