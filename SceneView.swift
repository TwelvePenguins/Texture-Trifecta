//
//  SceneView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 17/4/23.
//

import SwiftUI

struct SceneView: View {
        
    @Binding var collection: Collection
    
    @State var status: String = "Activated"
    
    @State var rotation = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("\(collection.name) \(status)")
                    .scaledToFit()
                    .ignoresSafeArea()
                    .frame(maxWidth: geo.size.width * 1)
//                                ForEach(collection.objects[0].parts, id: \.self) { part in
//                                    Image(part.name)
//                                        .resizable()
//                                        .scaledToFit()
//                                }
//                                    .frame(maxWidth: geo.size.width * 0.2)
//                                    .offset(x: geo.size.width * 0.2, y: geo.size.height * -0.2)
//                                    .rotationEffect(.degrees(180), anchor: .center)
//                                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                
                ForEach(collection.objects, id: \.self) { object in
                    Group {
                        ForEach(object.parts) { part in
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
                        .frame(maxWidth: object.name == "Penguin" ? geo.size.width * 0.2 : geo.size.width * 0.7)
                        .offset(x: geo.size.width * getOffset(of: object.name)[0], y: geo.size.height * getOffset(of: object.name)[1])
                        .rotationEffect(.degrees(Double(object.name == "Orca" ? 180 : rotation)), anchor: .center)
                        .rotation3DEffect(.degrees(Double(object.name == "Orca" ? 180 : rotation)), axis: (x: 1, y: 0, z: 0))
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
        return [0.2, -0.2]
    } else {
        return [0, 0]
    }
}

//func fireTimer(timer: Timer) {
//    status = "Activated"
//    print("Timer fired")
//}
