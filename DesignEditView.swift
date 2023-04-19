//
//  DesignEditView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI
import os.log

struct DesignEditView: View {
    
    @State var counter = 0
    @Binding var parts: Object
    @State var allTextures: [UIImage] = []
    @State var partSelected: String = ""
    @State var texturedSections: [TexturedSection] = []
    @State var textureSelected: UIImage = UIImage()
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Textures")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 40)
                        VStack (alignment: .center) {
                            NavigationLink {
                                CameraView()
                                    .onDisappear() {
                                        allTextures = retrieveImages(in: "AllTextures", imageName: nil)
                                    }
                            } label: {
                                ZStack(alignment: .center) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.accentColor)
                                        .frame(width: 260, height: 100)
                                    VStack {
                                        Image(systemName: "plus")
                                            .font(.system(size: 30, weight: .bold, design: .default))
                                        Text("Add Texture")
                                            .font(.headline)
                                    }
                                    .foregroundColor(.white)
                                }
                            }
                            .padding(.bottom, 15)
                            ScrollView(.vertical) {
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], alignment: .center, spacing: 10) {
                                    //Grid of textures
                                    ForEach(allTextures, id: \.self) { texture in
                                        Image(uiImage: texture)
                                            .resizable()
                                            .scaledToFit()
                                            .padding(10)
                                            .overlay(alignment: .bottomTrailing) {
                                                if partSelected != "" && textureSelected == texture {
                                                    Image(systemName: "checkmark.circle.fill")
                                                } else {
                                                    Rectangle()
                                                        .fill(.clear)
                                                }
                                            }
                                            .onTapGesture {
                                                if partSelected != "" {
                                                    if textureSelected == texture {
                                                        textureSelected = UIImage()
                                                        let elementToRemove = texturedSections.first(where: {$0.sectionName == partSelected})
                                                        texturedSections.removeAll(where: {$0 == elementToRemove})
                                                    } else if texturedSections.filter({$0.sectionName == partSelected}) != [] {
                                                        textureSelected = texture
                                                        texturedSections[texturedSections.firstIndex(where: {$0.sectionName == partSelected})!].texture = textureSelected
                                                    } else {
                                                        textureSelected = texture
                                                        texturedSections.append(TexturedSection(sectionName: partSelected, texture: textureSelected))
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                            .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.7)
                        }
                    }
                    .scaledToFit()
                    .padding(.trailing, 10)
                    Divider()
                    ZStack {
                        ForEach(parts.parts) { part in
                            ZStack {
                                Image(part.name)
                                if texturedSections.filter({$0.sectionName == part.name}) != [] {
                                    Image(uiImage: texturedSections[texturedSections.firstIndex(where: {$0.sectionName == part.name})!].texture)
                                        .resizable()
                                        .scaledToFill()
                                }
                                if partSelected == part.name {
                                    Image("SelectedMask")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .contentShape(.interaction, AnyShape(part.shape))
                            .scaledToFit()
                            .frame(maxWidth: geo.size.width * 0.6)
                            .mask {
                                Image(part.name)
                                    .scaledToFit()
                                    .frame(maxWidth: geo.size.width * 0.6)
                            }
                            .onTapGesture {
                                if partSelected == part.name {
                                    partSelected = ""
                                    textureSelected = UIImage()
                                } else {
                                    textureSelected = UIImage()
                                    partSelected = part.name
                                }
                                if texturedSections.filter({$0.sectionName == partSelected}) != [] {
                                    partSelected = part.name
                                    textureSelected = texturedSections[texturedSections.firstIndex(where: {$0.sectionName == partSelected})!].texture
                                }
                            }
                        }
                        .frame(minWidth: geo.size.width * 0.6, maxWidth: geo.size.width * 0.8)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            for texturedSection in texturedSections {
                                print(addImage(data: texturedSection.texture.pngData()!, targetDirectoryName: parts.name + "Textures", imageName: texturedSection.sectionName))
                            }
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                Text("Save")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            counter += 1
            allTextures = retrieveImages(in: "AllTextures", imageName: nil)
            if counter == 1 {
                for part in parts.parts {
                    if retrieveImages(in: parts.name + "Textures", imageName: part.name + ".png") != [] {
                        texturedSections.append(TexturedSection(sectionName: part.name, texture: retrieveImages(in: parts.name + "Textures", imageName: part.name + ".png")[0]))
                    }
                }
            }
        }
    }
}

fileprivate let logger = Logger(subsystem: "com.apple.du.yuhan.SSC-2023", category: "DesignEditView")
