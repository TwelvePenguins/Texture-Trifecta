//
//  FileManager.swift
//  SSC 2023
//
//  Created by Yuhan Du on 12/4/23.
//

import Foundation
import UIKit
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

func addImage(data: Data, targetDirectoryName: String, imageName: String?) -> Bool {
    //To add image with a name of UUID, enter nil
    
    var unwrappedName = ""
    if let imageName = imageName {
        unwrappedName = imageName
    } else {
        unwrappedName = UUID().uuidString
    }
    
    let url = findDirectoryURL(target: targetDirectoryName).appendingPathComponent("\(unwrappedName).png")
    
    do {
        try data.write(to: url)
        return true
    } catch {
        print(error.localizedDescription)
        return false
    }
}

func findFilesURL(in directory: String) -> [URL] {
    do {
        let URLs = try fm.contentsOfDirectory(at: findDirectoryURL(target: directory), includingPropertiesForKeys: [.nameKey, .pathKey])
        return URLs
    } catch {
        print(error.localizedDescription)
        return [getDocumentDirectory()]
    }
}

func retrieveImages(in directory: String) -> [UIImage] {
    let filePaths = findFilesURL(in: directory).map { $0.path(percentEncoded: false) }
    var imageArray: [UIImage] = []
    
    for path in filePaths {
        imageArray.append(UIImage(contentsOfFile: path)!)
    }
    
    return imageArray
}

func copyTexturesFromAllTextures(of image: String, to target: String, newName: String) -> Bool {
    //Never use this to add textures - You can't name it to be a UUID().
    let originalFileString = findFilesURL(in: "AllTextures").map({ $0.path(percentEncoded: false) }).filter { $0.contains(image) }
    let data = UIImage(contentsOfFile: originalFileString[0])?.pngData()
    
    return addImage(data: data!, targetDirectoryName: "PenguinTextures", imageName: newName)
}

// On drop -> Get UUID()
// get index of UUID -> get url -> retrieve ui image from path -> convert to data -> write in new directory
