//
//  ViewModel.swift
//  Notes
//
//  Created by Gonzalo Olvera Monroy on 14/01/23.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var note = ""
    @Published var date = Date()
    @Published var show = false
    @Published var updateItem : Notes!
    
    
    // CoreData
    
    func saveData(context: NSManagedObjectContext) {
        let newNote = Notes(context: context)
        newNote.note = note
        newNote.date = date
        
        do {
            try context.save()
            print("Save note")
            show.toggle()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(item: Notes, context: NSManagedObjectContext) {
        context.delete(item)
        //try! context.save()
        do {
            try context.save()
            print("delete note")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func sendData(item: Notes) {
        updateItem = item
        note = item.note ?? ""
        date = item.date ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext) {
        updateItem.date = date
        updateItem.note = note
        do {
            try context.save()
            print("Update note")
            show.toggle() 
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
}
