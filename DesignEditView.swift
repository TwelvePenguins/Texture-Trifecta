//
//  DesignEditView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI

struct DesignEditView: View {
    
    @ObservedObject var manager: DesignsManager
    var textures: [String] = ["a", "b", "c", "d"] //Placeholders - Captured textures go here.
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                HStack {
                    VStack(alignment: .center) {
                        Text("Textures")
                        
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
                        .frame(height: geo.size.height * 0.7)
                    }
                    .frame(minWidth: geo.size.width * 0.3)
                    .scaledToFit()
                    Divider()
                    ZStack {
                        ForEach($manager.sections) { $section in
                            if section.texture == nil {
                                Image(section.name)
                                    .contentShape(AnyShape(section.actualShape))
                                    .onTapGesture {
                                        section.selected = true
                                    }
                            } else if section.selected {
                                Image("SelectedMask")
                                    .mask {
                                        Image(section.name)
                                            .scaledToFit()
                                    }
                            } else {
                                ZStack {
                                    Image(section.texture!)
                                        .mask {
                                            Image(section.name)
                                                .scaledToFit()
                                        }
                                    if section.selected {
                                        Image("SelectedMask")
                                            .mask{
                                                Image(section.name)
                                                    .scaledToFit()
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
