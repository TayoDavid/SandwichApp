//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by Omotayo on 18/02/2022.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed = false
    
    var body: some View {
        Image(sandwich.imageName)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .navigationTitle(sandwich.name)
            .onTapGesture { zoomed.toggle() }
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SandwichDetail(sandwich: testData[0])
        }
     }
}
