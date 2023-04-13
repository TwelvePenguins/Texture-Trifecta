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

func findSubPath(target: String) -> String {
    return fm.subpaths(atPath: getDocumentDirectory().path())!.first(where: {$0 == target}) ?? ""
}

func addImage(data: Data, targetDirectoryName: String) {
    fm.createFile(atPath: findSubPath(target: targetDirectoryName), contents: data)
}
