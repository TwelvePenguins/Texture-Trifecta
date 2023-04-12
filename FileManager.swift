//
//  FileManager.swift
//  SSC 2023
//
//  Created by Yuhan Du on 12/4/23.
//

import Foundation

let fm = FileManager()

func getPicturesDirectoryURL() -> URL {
    let paths = fm.urls(for: .picturesDirectory, in: .userDomainMask)
    return paths[0]
}

func getPicturesDirectoryString() -> String {
    let strings = NSSearchPathForDirectoriesInDomains(.picturesDirectory, .userDomainMask, false)
    return strings[0]
}

func createDirectory(name: String, path: URL) {
    do {
        try fm.createDirectory(at: path.appendingPathComponent(name, conformingTo: .folder), withIntermediateDirectories: true)
    } catch {
        print("Error when creating directory")
    }
}

func findSubPath(target: String) -> String {
    return fm.subpaths(atPath: getPicturesDirectoryString())!.first(where: {$0 == target}) ?? ""
    //Force unwrap since directories are created upon initialisation
}

func addImage(data: Data, targetDirectoryName: String) {
    fm.createFile(atPath: findSubPath(target: targetDirectoryName), contents: data)
}
