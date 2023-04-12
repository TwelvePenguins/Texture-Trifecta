import SwiftUI

struct ContentView: View {
    
    var body: some View {
        DesignEditView()
            .onAppear {
                print(getPicturesDirectoryURL())
                createDirectory(name: "All Textures", path: getPicturesDirectoryURL())
                createDirectory(name: "Penguin Textures", path: getPicturesDirectoryURL())
            }
    }
}
