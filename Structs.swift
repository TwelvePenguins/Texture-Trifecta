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
    var shape: PShapes
    var texture: String?
    var selected: Bool = false
    
    enum PShapes: Codable {
        case Torso
        case Belly
        case Beak
        case Flipper
        case LFoot
        case RFoot
        case Eye
    }
    
    init(id: UUID = UUID(),
         name: String,
         shape: PShapes,
         texture: String? = nil,
         selected: Bool = false) {
        self.id = id
        self.name = name
        self.shape = shape
        self.texture = texture
        self.selected = selected
    }
    
    @available(iOS 16.0, *)
    var actualShape: AnyShape {
        switch shape {
        case .Torso: return AnyShape(PenguinTorso())
        case .Belly: return AnyShape(PenguinBelly())
        case .Beak: return AnyShape(PenguinBeak())
        case .Flipper: return AnyShape(PenguinFlipper())
        case .LFoot: return AnyShape(PenguinLFoot())
        case .RFoot: return AnyShape(PenguinRFoot())
        case .Eye: return AnyShape(PenguinEye())
        }
    }
}
