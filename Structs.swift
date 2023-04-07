//
//  Structs.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var name: any Shape
    var texture: String?
    var selected: Bool = false
}
