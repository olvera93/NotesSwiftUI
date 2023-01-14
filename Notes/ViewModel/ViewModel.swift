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
}
