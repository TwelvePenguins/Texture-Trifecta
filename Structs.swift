//
//  Structs.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI

struct Section: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var shape: any Shape
    var isTextured: Bool = false

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }

}
