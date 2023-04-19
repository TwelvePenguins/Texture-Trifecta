//
//  IntroView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 19/4/23.
//

import SwiftUI

struct IntroView: View {
    
    @Binding var showTutorial: Bool
    
    var body: some View {
            VStack(alignment: .center) {
                Text("Welcome to \n Texture Trifecta.")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .bold()
                    .padding(.bottom, 50)
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 30) {
                    HStack(alignment: .center, spacing: 20) {
                        Image(systemName: "camera.viewfinder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading) {
                            Text("Capture")
                                .font(.headline)
                                .bold()
                            Text("Observe your surroundings. Take in the details and colours. Capture macro shots of the textures around you.")
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: 385)
                                .foregroundColor(.secondary)
                        }
                    }
                    HStack(alignment: .center, spacing: 20) {
                        Image(systemName: "sparkles")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading) {
                            Text("Create")
                                .font(.headline)
                                .bold()
                            Text("Think out of the box. Let your imagination take the lead. Fill in parts of animals with your collected textures.")
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: 385)
                                .foregroundColor(.secondary)
                        }
                    }
                    HStack(alignment: .center, spacing: 20) {
                        Image(systemName: "sparkles.rectangle.stack")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading) {
                            Text("Compile")
                                .font(.headline)
                                .bold()
                            Text("Immerse yourself with the animals you gave life to. If you're patient, maybe they'll exhibit some curious behaviours...")
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: 385)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.bottom, 60)
                Button {
                    showTutorial = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 400, height: 50)
                            .foregroundColor(.accentColor)
                        Text("Continue")
                            .foregroundColor(.white)
                    }
                }
            }
            .interactiveDismissDisabled(true)
    }
}


