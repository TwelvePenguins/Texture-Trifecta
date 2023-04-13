import SwiftUI

struct ContentView: View {
    
    var body: some View {
        DesignEditView()
            .onAppear {
                print(getDocumentDirectory())
                
                createDirectory(name: "AllTextures", path: getDocumentDirectory())
                createDirectory(name: "PenguinTextures", path: getDocumentDirectory())
                print(findDirectoryURL(target: "AllTextures"))
                
            }
    }
}
