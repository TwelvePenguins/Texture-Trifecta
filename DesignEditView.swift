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
    
    @State var penguinSections = [
        Section(name: "PenguinTorso", shape: PenguinTorso()),
        Section(name: "PenguinBelly", shape: PenguinBelly()),
        Section(name: "PenguinEye", shape: PenguinEye()),
        Section(name: "PenguinFlipper", shape: PenguinFlipper()),
        Section(name: "PenguinLFoot", shape: PenguinLFoot()),
        Section(name: "PenguinRFoot", shape: PenguinRFoot()),
        Section(name: "PenguinBeak", shape: PenguinBeak())
    ]
    @State var allTextures: [UIImage] = []
    
    @State var sectionSelected: String = ""
    
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
                                        allTextures = retrieveImages(in: "AllTextures")
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
                                        if sectionSelected != "" && textureSelected == texture {
                                            Image(uiImage: texture)
                                                .resizable()
                                                .scaledToFit()
                                                .padding(10)
                                                .overlay(alignment: .bottomTrailing) {
                                                    Image(systemName: "checkmark.circle.fill")
                                                }
                                                .onTapGesture {
                                                    if sectionSelected != "" {
                                                        if textureSelected == texture {
                                                            textureSelected = UIImage()
                                                            let elementToRemove = texturedSections.first(where: {$0.sectionName == sectionSelected})
                                                            texturedSections.removeAll(where: {$0 == elementToRemove})
                                                        } else if texturedSections.filter({$0.sectionName == sectionSelected}) != [] {
                                                            textureSelected = texture
                                                            texturedSections[texturedSections.firstIndex(where: {$0.sectionName == sectionSelected})!].texture = textureSelected
                                                            print(texturedSections)
                                                        } else {
                                                            textureSelected = texture
                                                            texturedSections.append(TexturedSection(sectionName: sectionSelected, texture: textureSelected))
                                                            print(texturedSections)
                                                        }
                                                    }
                                                }
                                        } else {
                                            Image(uiImage: texture)
                                                .resizable()
                                                .scaledToFit()
                                                .padding(10)
                                                .onTapGesture {
                                                    if sectionSelected != "" {
                                                        if textureSelected == texture {
                                                            textureSelected = UIImage()
                                                            let elementToRemove = texturedSections.first(where: {$0.sectionName == sectionSelected})
                                                            texturedSections.removeAll(where: {$0 == elementToRemove})
                                                        } else if texturedSections.filter({$0.sectionName == sectionSelected}) != [] {
                                                            textureSelected = texture
                                                            texturedSections[texturedSections.firstIndex(where: {$0.sectionName == sectionSelected})!].texture = textureSelected                                                      } else {
                                                                textureSelected = texture
                                                                texturedSections.append(TexturedSection(sectionName: sectionSelected, texture: textureSelected))
                                                                print(texturedSections)
                                                            }
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
                        ForEach(penguinSections) { section in
                            ZStack {
                                Image(section.name)
                                if texturedSections.filter({$0.sectionName == section.name}) != [] {
                                    Image(uiImage: texturedSections[texturedSections.firstIndex(where: {$0.sectionName == section.name})!].texture)
                                        .resizable()
                                        .scaledToFill()
                                }
                                if sectionSelected == section.name {
                                    Image("SelectedMask")
                                }
                            }
                            .contentShape(AnyShape(section.shape))
                            .scaledToFit()
                            .frame(maxWidth: geo.size.width * 0.6)
                            .mask {
                                Image(section.name)
                                    .scaledToFit()
                                    .frame(maxWidth: geo.size.width * 0.6)
                            }
                            .onTapGesture {
                                if sectionSelected == section.name {
                                    sectionSelected = ""
                                    textureSelected = UIImage()
                                } else {
                                    textureSelected = UIImage()
                                    sectionSelected = section.name
                                }
                                if texturedSections.filter({$0.sectionName == sectionSelected}) != [] {
                                    sectionSelected = section.name
                                    print(texturedSections.filter({$0.sectionName == sectionSelected}))
                                    textureSelected = texturedSections[texturedSections.firstIndex(where: {$0.sectionName == sectionSelected})!].texture
                                }
                            }
                        }
                        .frame(maxWidth: geo.size.width * 0.6)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Save")
                                .foregroundColor(.accentColor)
                        }
                    }
                }
            }
        }
        .onAppear {
            allTextures = retrieveImages(in: "AllTextures")
        }
    }
}

fileprivate let logger = Logger(subsystem: "com.apple.du.yuhan.SSC-2023", category: "DesignEditView")

func getIndexOfSection(name: String) {
    
}
