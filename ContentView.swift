import SwiftUI

struct ContentView: View {
    
    var body: some View {
        DesignEditView()
            .onAppear {
                print(getPicturesDirectory())
                createDirectory(name: "All Textures", path: getPicturesDirectory())
                createDirectory(name: "Penguin Textures", path: getPicturesDirectory())
            }
    }
}
