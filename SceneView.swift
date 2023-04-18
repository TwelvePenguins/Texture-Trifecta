//
//  SceneView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 17/4/23.
//

import SwiftUI
import os.log

struct SceneView: View {
    
    let timer = Timer.publish(every: 10, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @Binding var collection: Collection
    @State var rotation = 0
    @State var penguinOffset: Double = 0
    @State var sproutOpacity: Double = 0
    @State var textures: [TexturedSection] = []
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("\(collection.name)")
                    .scaledToFit()
                    .ignoresSafeArea()
                    .frame(maxWidth: geo.size.width * 1)
                    .onReceive(timer) { _ in
                        withAnimation {
                            sproutOpacity = 1
                            penguinOffset = -250
                        }
                        rotation = 180
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            sproutOpacity = 0
                            rotation = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation {
                                penguinOffset = 0
                            }
                        }
                        print("Timer activated")
                    }
                //                                                                ForEach(collection.objects[0].parts, id: \.self) { part in
                //                                                                    Image(part.name)
                //                                                                        .resizable()
                //                                                                        .scaledToFit()
                //                                                                }
                //                                                                    .frame(maxWidth: geo.size.width * 0.2)
                //                                                                    .rotationEffect(.degrees(180), anchor: .center)
                //                                                                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                //                                                                    .offset(x: geo.size.width * 0.2, y: geo.size.height * -0.2)
                
                
                ForEach(collection.objects, id: \.self) { object in
                    Group {
                        ForEach(object.parts) { part in
                            VStack(spacing: -5) {
                                if object.name == "Penguin" {
                                    Text(rotation == 180 ? "!!" : "??")
                                        .font(.title)
                                        .foregroundColor(.red)
                                        .fontDesign(.rounded)
                                        .rotationEffect(.degrees(30))
                                }
                                
                                if textures.filter({$0.sectionName == part.name}) != [] {
                                    Image(uiImage: textures.first(where: {$0.sectionName == part.name})!.texture)
                                        .resizable()
                                        .scaledToFill()
                                        .mask {
                                            Image(part.name)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: object.name == "Penguin" ? geo.size.width * 0.2 : geo.size.width * 0.7)

                                        }
                                } else {
                                    Image(part.name)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: object.name == "Penguin" ? geo.size.width * 0.2 : geo.size.width * 0.7)
                    .rotationEffect(.degrees(Double(object.name == "Penguin" ? rotation : 0)), anchor: .center)
                    .rotation3DEffect(.degrees(Double(object.name == "Penguin" ? rotation : 0)), axis: (x: 1, y: 0, z: 0))
                    .offset(x: geo.size.width * getOffset(of: object.name)[0], y: object.name == "Penguin" ? geo.size.height * getOffset(of: object.name)[1] + penguinOffset : geo.size.width * getOffset(of: object.name)[1])
                    .rotationEffect(.degrees(Double(object.name == "Orca" ? 180 : 0)), anchor: .center)
                    .rotation3DEffect(.degrees(Double(object.name == "Orca" ? 180 : 0)), axis: (x: 1, y: 0, z: 0))
                    VStack(spacing: -240) {
                        Text("POOF!")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontDesign(.rounded)
                            .rotationEffect(.degrees(30))
                        Image("OrcaSprout")
                            .resizable()
                            .scaledToFit()
                    }
                    .opacity(sproutOpacity)
                    .animation(.easeIn(duration: 0.2), value: sproutOpacity)
                }
            }
            .onAppear{
                for object in collection.objects {
                    for part in object.parts {
                        if retrieveImages(in: object.name + "Textures", imageName: part.name + ".png") != [] {
                            textures.append(TexturedSection(sectionName: part.name, texture: (retrieveImages(in: object.name + "Textures", imageName: part.name + ".png")[0])))
                        }
                    }
                }
            }
        }
    }
}

func getOffset(of object: String) -> [Double] {
    //first integer is x, secoond integer is y
    if object == "Orca" {
        return [0.2, 0.02]
    } else if object == "Penguin" {
        return [0.2, -0.22]
    } else {
        return [0, 0]
    }
}

fileprivate let logger = Logger(subsystem: "com.apple.du.yuhan.SSC-2023", category: "SceneView")
