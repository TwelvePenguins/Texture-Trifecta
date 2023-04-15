//
//  Structs.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI

struct Part: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var shape: any Shape

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Part, rhs: Part) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }

}

struct TexturedSection: Identifiable {
    var id = UUID()
    var sectionName: String
    var texture: UIImage
}

extension TexturedSection: Equatable {
    static func == (lhs: TexturedSection, rhs: TexturedSection) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.sectionName == rhs.sectionName &&
            lhs.texture == rhs.texture
    }
}

struct Collection: Identifiable {
    var id = UUID()
    var name: String
    var objects: [Object]
}

struct Object: Hashable {
    var name: String
    var parts: [Part]
}
