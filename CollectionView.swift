//
//  CollectionView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 15/4/23.
//

import SwiftUI

struct CollectionView: View {
    
    @State var collections: [Collection] = [
        Collection(name: "Antics in Antartica", objects: [
            Object(name: "Penguin", parts: [
                Part(name: "PenguinTorso", shape: PenguinTorso()),
                Part(name: "PenguinBelly", shape: PenguinBelly()),
                Part(name: "PenguinEye", shape: PenguinEye()),
                Part(name: "PenguinFlipper", shape: PenguinFlipper()),
                Part(name: "PenguinLFoot", shape: PenguinLFoot()),
                Part(name: "PenguinRFoot", shape: PenguinRFoot()),
                Part(name: "PenguinBeak", shape: PenguinBeak())
            ]),
            Object(name: "Orca", parts: [
                Part(name: "OrcaBody", shape: OrcaBody()),
                Part(name: "OrcaBelly", shape: OrcaBelly()),
                Part(name: "OrcaSpot1", shape: OrcaSpot1()),
                Part(name: "OrcaSpot2", shape: OrcaSpot2()),
                Part(name: "OrcaEye", shape: OrcaEye())
            ])
        ]),
        
    ]
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                VStack {
                    ForEach($collections) { $collection in
                        Text(collection.name)
                            .font(.title2)
                        HStack {
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: [GridItem(.flexible(minimum: 100, maximum: 150))], alignment: .center, spacing: 10) {
                                    ForEach($collection.objects, id: \.self) { $object in
                                        NavigationLink {
                                            DesignEditView(parts: $object)
                                        } label: {
                                            VStack(spacing: 5) {
                                                Image(object.name)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .mask(RoundedRectangle(cornerRadius: 10))
                                                Text(object.name)
                                                    .font(.caption)
                                                    .bold()
                                            }
                                        }
                                    }
                                }
                            }
                            NavigationLink {
                                
                            } label: {
                                ZStack(alignment: .center) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.accentColor)
                                        .frame(width: 260, height: 100)
                                    VStack {
                                        Image(systemName: "photo.artframe")
                                            .font(.system(size: 30, weight: .bold, design: .default))
                                        Text("View Scene")
                                            .font(.headline)
                                    }
                                    .foregroundColor(.white)
                                }
                            }
                        }
                        .padding([.leading, .trailing], 20)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 5))
                        .frame(maxWidth: geo.size.width * 0.7, maxHeight: geo.size.height * 0.3, alignment: .leading)
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    Text("More to come...")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .navigationTitle("Collections")
            }
        }
    }
}
