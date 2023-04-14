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
    
    @State var dropImage: [Image] = [Image("PenguinTorso"),
                                     Image("PenguinBelly"),
                                     Image("PenguinEye"),
                                     Image("PenguinFlipper"),
                                     Image("PenguinLFoot"),
                                     Image("PenguinRFoot"),
                                     Image("PenguinBeak"),
    ]
    
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
                                        Image(uiImage: texture)
                                            .resizable()
                                            .scaledToFit()
                                            .padding(10)
                                            .draggable(Image(uiImage: texture)
)
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
                        ForEach($penguinSections) { $section in
                            dropImage[penguinSections.firstIndex(of: section)!]
                                .contentShape(AnyShape(section.shape))
                                .scaledToFit()
                                .frame(maxWidth: geo.size.width * 0.6)
                                .mask {
                                    Image(section.name)
                                        .scaledToFit()
                                        .frame(maxWidth: geo.size.width * 0.6)
                                }
                                .dropDestination(for: Image.self) { items, location in
                                    dropImage[penguinSections.firstIndex(of: section)!] = items.first ?? Image(section.name)
                                    logger.debug("Drop photo")
                                    return true
                                }
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
        }
        .onAppear {
            allTextures = retrieveImages(in: "AllTextures")
        }
    }
}

fileprivate let logger = Logger(subsystem: "com.apple.du.yuhan.SSC-2023", category: "DesignEditView")
