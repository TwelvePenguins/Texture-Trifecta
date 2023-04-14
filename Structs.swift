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
