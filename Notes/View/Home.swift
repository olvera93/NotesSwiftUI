//
//  Home.swift
//  Notes
//
//  Created by Gonzalo Olvera Monroy on 14/01/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        Button(action: {
            model.show.toggle()
        }) {
            Text("+")
        }.sheet(isPresented: $model.show, content: {
            addView(model: model)
        })
    }
}

