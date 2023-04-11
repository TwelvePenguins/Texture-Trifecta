//
//  DesignEditView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI

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
    var textures: [String] = ["a", "b", "c", "d"] //Placeholders - Captured textures go here.
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Textures")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 40)
                    VStack (alignment: .center) {
                        Button {
                            //Open camera functionality here
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
                            LazyVGrid(columns: [GridItem(.flexible(maximum: 130)), GridItem(.flexible(maximum: 130))], alignment: .center) {
                                //Grid of textures
                                ForEach(textures, id: \.self) { texture in
                                    Image(texture)
                                        .resizable()
                                        .scaledToFill()
                                        .padding(10)
                                }
                            }
                        }
                        .frame( width: geo.size.width * 0.3, height: geo.size.height * 0.7)
                    }
                }
                .scaledToFit()
                Divider()
#warning("RETHINK THIS WITH DRAG AND DROP")
                ZStack {
                    ForEach(penguinSections, id: \.self) { section in
                        if section.texture == nil {
                            Image(section.name)
                                .contentShape(AnyShape(section.shape))
                                .onTapGesture {
                                    print(section.name)
                                }
                        }
                    }
                }
            }
        }
    }
}

