//
//  SceneView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 17/4/23.
//

import SwiftUI

struct SceneView: View {
    
    let timer = Timer.publish(every: 7, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @Binding var collection: Collection
    @State var rotation = 0
    @State var penguinOffset: Double = 0
    @State var sproutOpacity: Double = 0
        
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
//                                                ForEach(collection.objects[0].parts, id: \.self) { part in
//                                                    Image(part.name)
//                                                        .resizable()
//                                                        .scaledToFit()
//                                                }
//                                                    .frame(maxWidth: geo.size.width * 0.2)
//                                                    .rotationEffect(.degrees(180), anchor: .center)
//                                                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
//                                                    .offset(x: geo.size.width * 0.2, y: geo.size.height * -0.2)

                
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
                                if retrieveImages(in: object.name + "Textures", imageName: part.name + ".png") != [] {
                                    Image(uiImage: retrieveImages(in: object.name + "Textures", imageName: part.name + ".png")[0])
                                        .mask {
                                            Image(part.name)
                                                .scaledToFit()
                                                .frame(maxWidth: geo.size.width * 0.6)
                                        }
                                } else {
                                    Image(part.name)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        }
                        .frame(maxWidth: object.name == "Penguin" ? geo.size.width * 0.2 : geo.size.width * 0.7)
                        .rotationEffect(.degrees(Double(object.name == "Penguin" ? rotation : 0)), anchor: .center)
                        .rotation3DEffect(.degrees(Double(object.name == "Penguin" ? rotation : 0)), axis: (x: 1, y: 0, z: 0))
                        .offset(x: geo.size.width * getOffset(of: object.name)[0], y: object.name == "Penguin" ? geo.size.height * getOffset(of: object.name)[1] + penguinOffset : geo.size.width * getOffset(of: object.name)[1])
                        .rotationEffect(.degrees(Double(object.name == "Orca" ? 180 : 0)), anchor: .center)
                        .rotation3DEffect(.degrees(Double(object.name == "Orca" ? 180 : 0)), axis: (x: 1, y: 0, z: 0))

                    }
                }
                VStack(spacing: -240) {
                    Text("POOF!")
                        .font(.title)
                        .fontDesign(.rounded)
                        .rotationEffect(.degrees(30))
                    Image("OrcaSprout")
                        .resizable()
                        .scaledToFit()
                }
//                .offset(x: geo.size.width * 0, y: geo.size.height * 0)
                .opacity(sproutOpacity)
                .animation(.easeIn(duration: 0.2), value: sproutOpacity)
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

