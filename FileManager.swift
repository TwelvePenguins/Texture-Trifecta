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

func findDirectoryURL(target: String) -> URL {
    do {
        let URLs = try fm.contentsOfDirectory(at: getDocumentDirectory(), includingPropertiesForKeys: [.nameKey, .pathKey])
        let strings = URLs.map({$0.path()})
        let finalString = strings.filter({$0.contains("/\(target)/")})
        return URLs[strings.firstIndex(of: finalString[0])!]
    } catch {
        print("Error when fetching contents of directory")
        return getDocumentDirectory()
    }
}

func addImage(data: Data, targetDirectoryName: String) -> Bool {
    
//    fm.createFile(atPath: findDirectoryPath(target: "AllTextures").path(), contents: data)
    let url = findDirectoryURL(target: targetDirectoryName).appendingPathComponent("Yes.png")

    do {
        try data.write(to: url)
        return true
    } catch {
        print(error.localizedDescription)
        return false
    }
}
