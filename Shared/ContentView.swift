//
//  ContentView.swift
//  Shared
//
//  Created by Omotayo on 18/02/2022.
//

import SwiftUI

struct ContentView: View {
    var sandwiches: [Sandwich] = []
    var body: some View {
        NavigationView {
            List{
                ForEach(sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                
                HStack {
                    Spacer()
                    Text("\(sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(sandwiches: testData)
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
