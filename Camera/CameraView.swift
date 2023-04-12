//
//  CameraView.swift
//  SSC 2023
//
//  Created by Yuhan Du on 12/4/23.
//

import SwiftUI

/*#-code-walkthrough(cv.intro)*/
struct CameraView: View {
    /*#-code-walkthrough(cv.intro)*/
    /*#-code-walkthrough(cv.observedObject)*/
    @StateObject private var model = DataModel()
    /*#-code-walkthrough(cv.observedObject)*/
    
    private static let barHeightFactor = 0.15
    
    /*#-code-walkthrough(delayedShutter.delayCount)*/
    /*#-code-walkthrough(delayedShutter.delayCount)*/
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geometry in
                /*#-code-walkthrough(previewflow.viewPreviews)*/
                ViewfinderView(image: /*#-code-walkthrough(previewflow.binding)*/ $model.viewfinderImage /*#-code-walkthrough(previewflow.binding)*/)
                /*#-code-walkthrough(previewflow.viewPreviews)*/
                    .overlay(alignment: .bottom) {
                        buttonsView()
                            .frame(height: geometry.size.height * Self.barHeightFactor)
                            .background(.black.opacity(0.75))
                    }
                    .overlay(alignment: .center)  {
                        Color.clear
                            .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                            .accessibilityElement()
                            .accessibilityLabel("View Finder")
                            .accessibilityAddTraits([.isImage])
                    }
                    .background(.black)
            }
            .task {
                await model.camera.start()
                await model.loadPhotos()
                await model.loadThumbnail()
            }
            .navigationTitle("Camera")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .ignoresSafeArea()
            .statusBar(hidden: true)
        }
    }
    
    private func buttonsView() -> some View {
        HStack(spacing: 60) {
            
            Spacer()
            NavigationLink {
                PhotoCollectionView(photoCollection: model.photoCollection)
                    .onAppear {
                        model.camera.isPreviewPaused = true
                    }
                    .onDisappear {
                        model.camera.isPreviewPaused = false
                    }
            } label: {
                Label {
                    Text("Gallery")
                } icon: {
                    ThumbnailView(image: model.thumbnailImage)
                }
            }
            Button {
                model.camera.takePhoto()
            } label: {
                Label {
                    Text("Take Photo")
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
            Button {
                model.camera.switchCaptureDevice()
            } label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
    
}
