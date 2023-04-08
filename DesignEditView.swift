//
//  DesignEditView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 5/4/23.
//

import Foundation
import SwiftUI

struct DesignEditView: View {
    var textures: [String] = ["a", "b", "c", "d"] //Placeholders - Captured textures go here.
//                               , Section(name: "PenguinBeak"), Section(name: "PenguinBelly"), Section(name: "PenguinEye"), Section(name: "PenguinRFoot"), Section(name: "PenguinLFoot"), Section(name: "PenguinFlipper")]
        
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
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
            }
            ZStack{
                Image("PenguinBelly")
                    .contentShape(PenguinBelly())
                    .onTapGesture {
                        print("hello")
                    }
                Image("PenguinTorso")
                    .contentShape(PenguinTorso())
                    .onTapGesture {
                        print("Torso")
                    }
                    
//                Image("Vector 1")
//                    .mask {
//                        Image("Vector 1")
//                    }
//                    .border(.red)
//                ForEach(sections, id: \.self) { section in
//                    if section.texture == nil {
//                        section.name()
//                    } else {
//                        Image(section.texture!)
//                            .mask {
//                                section.name()
//                            }
//                    }
//                }
            }
        }
    }
}
