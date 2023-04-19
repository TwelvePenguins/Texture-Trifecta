import SwiftUI

struct ContentView: View {
        
    init() {
        createDirectory(name: "AllTextures", path: getDocumentDirectory())
        createDirectory(name: "PenguinTextures", path: getDocumentDirectory())
        createDirectory(name: "OrcaTextures", path: getDocumentDirectory())
        
        print(getDirectoryURL(target: "AllTextures"))
    }
    
    @AppStorage("TutorialStatus") var showTutorial = true
    
    var body: some View {
        CollectionView()
            .sheet(isPresented: $showTutorial) {
                IntroView(showTutorial: $showTutorial)
            }
    }
}
