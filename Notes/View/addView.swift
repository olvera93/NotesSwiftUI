//
//  addView.swift
//  Notes
//
//  Created by Gonzalo Olvera Monroy on 14/01/23.
//

import SwiftUI

struct addView: View {
    
    @ObservedObject var model : ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            
            Text("Add Note")
                .font(.largeTitle)
                .bold()
            Spacer()
            
            TextEditor(text: $model.note)
            Divider()
            DatePicker("Select Date", selection: $model.date)
            Spacer()
            Button(action: {
                model.saveData(context: context)
            }) {
                Label(title: { Text("Save").foregroundColor(.white).bold() }, icon: { Image(systemName: "plus").foregroundColor(.white) })
            }.padding()
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(Color.blue)
                .cornerRadius(8)
            
        }.padding()
    }
}

