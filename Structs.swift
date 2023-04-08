//
//  Structs.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI

struct Section: Identifiable, Codable {
    var id = UUID()
    var name: String
    var shape: any PenguinSection
    var texture: String?
    var selected: Bool = false
    
    enum Keys: CodingKey {
        case id, name, shape, texture, selected
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(texture, forKey: .texture)
        try container.encode(selected, forKey: .selected)
        try container.encode(shape.name, forKey: .shape)
    }
    
    init(id: UUID = UUID(),
         name: String,
         shape: any PenguinSection,
         texture: String? = nil,
         selected: Bool = false) {
        self.id = id
        self.name = name
        self.shape = shape
        self.texture = texture
        self.selected = selected
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)

        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.texture = try container.decode(String?.self, forKey: .texture)
        self.selected = try container.decode(Bool.self, forKey: .selected)

        let shape = try container.decode(String.self, forKey: .shape)
        switch shape {
        case "PenguinTorso": self.shape = PenguinTorso()
        case "PenguinBelly": self.shape = PenguinBelly()
        case "PenguinBeak": self.shape = PenguinBeak()
        case "PenguinFlipper": self.shape = PenguinFlipper()
        case "PenguinLFoot": self.shape = PenguinLFoot()
        case "PenguinRFoot": self.shape = PenguinRFoot()
        case "PenguinEye": self.shape = PenguinEye()
        default: fatalError("OH NO SHAPE WRONG")
        }
    }
}
