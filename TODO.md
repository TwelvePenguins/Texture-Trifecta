#  TODO

## To implement: 
- Drag & Drop
- Show folder contents in gallery and textures selection panel

## Good to have: 
- Fix navigation bar in CamerView and PhotoItemView
- Add tap to focus

https://github.com/rorodriguez116/SwiftCamera

//
//  DesignsManager.swift
//  SSC 2023
//
//  Created by Yuhan Du on 6/4/23.
//

import Foundation
import SwiftUI

class DesignsManager: ObservableObject {
    @Published var sections: [Section] = [] {
        didSet {
            save()
        }
    }
    
    let sampleSections: [Section] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "sections.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedSections = try? propertyListEncoder.encode(sections)
        try? encodedSections?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalSections: [Section]!
        
        if let retrievedSectionData = try? Data(contentsOf: archiveURL),
           let decodedSections = try? propertyListDecoder.decode([Section].self, from: retrievedSectionData) {
            finalSections = decodedSections
        } else {
            finalSections = sampleSections
        }
        
        sections = finalSections
    }
}

