//
//  FileManager.swift
//  SSC 2023
//
//  Created by Yuhan Du on 12/4/23.
//

import Foundation
import os.log

let fm = FileManager()

func getDocumentDirectory() -> URL {
    let paths = fm.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}


func createDirectory(name: String, path: URL) {
    do {
        try fm.createDirectory(at: path.appendingPathComponent(name, conformingTo: .folder), withIntermediateDirectories: true)
    } catch {
        print(error.localizedDescription)
    }
}

func findDirectoryPath(target: String) -> URL {
    do {
        let contents = try fm.contentsOfDirectory(at: getDocumentDirectory(), includingPropertiesForKeys: [.nameKey, .pathKey]).map({$0.path()})
        let finalString = contents.filter({$0.contains("/\(target)/")})
        return URL(string: finalString[0])!
    } catch {
        print("Error when fetching contents of directory")
        return getDocumentDirectory()
    }
}

func addImage(data: Data, targetDirectoryName: String) -> Bool {
    
//    fm.createFile(atPath: findDirectoryPath(target: "AllTextures").path(), contents: data)
    let url = findDirectoryPath(target: targetDirectoryName).appendingPathComponent("Yes.png")

    do {
        try data.write(to: url)
        return true
    } catch {
        print("Error adding image")
        return false
    }
}
#warning("This doesn't work. :(")
