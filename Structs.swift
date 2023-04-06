//
//  Structs.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation

struct Section: Identifiable {
    var id = UUID()
    var name: String
    var texture: String?
    var selected: Bool = false
}
