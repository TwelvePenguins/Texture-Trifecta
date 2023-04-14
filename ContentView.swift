import SwiftUI

struct ContentView: View {
    init() {
        print(getDocumentDirectory())
        
        createDirectory(name: "AllTextures", path: getDocumentDirectory())
        createDirectory(name: "PenguinTextures", path: getDocumentDirectory())
        
        print(getDirectoryURL(target: "AllTextures"))
        
    }
    
    var body: some View {
        DesignEditView()
    }
}
