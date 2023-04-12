//
//  FileManager.swift
//  SSC 2023
//
//  Created by Yuhan Du on 12/4/23.
//

import Foundation

let fm = FileManager()

func getPicturesDirectory() -> URL {
    let paths = fm.urls(for: .picturesDirectory, in: .userDomainMask)
    return paths[0]
}

func createDirectory(name: String, path: URL) {
    do {
        try fm.createDirectory(at: path.appendingPathComponent(name, conformingTo: .folder), withIntermediateDirectories: true)
    } catch {
        print("Error when creating directory")
    }
}

//class FileManager {
//
//    init() {
//        let fm = FileManager()
//        fm.createDirectory(at: <#T##URL#>, withIntermediateDirectories: <#T##Bool#>, attributes: <#T##[FileAttributeKey : Any]?#>)
//    }
//
//    func getTextureDirectoryURL() -> URL {
//        var doCreateDirectory: Bool
//
//        FileManager.create
//
//
//    }
//}
