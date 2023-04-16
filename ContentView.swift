import SwiftUI

struct ContentView: View {
    init() {
        createDirectory(name: "AllTextures", path: getDocumentDirectory())
        createDirectory(name: "PenguinTextures", path: getDocumentDirectory())
        createDirectory(name: "OrcaTextures", path: getDocumentDirectory())
        
        print(getDirectoryURL(target: "AllTextures"))
        
    }
    
    var body: some View {
        TestView()
    }
}
