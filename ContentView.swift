import SwiftUI

struct ContentView: View {
    
    var body: some View {
        DesignEditView()
            .onAppear {
                print(getDocumentDirectory())
                
                createDirectory(name: "AllTextures", path: getDocumentDirectory())
                createDirectory(name: "PenguinTextures", path: getDocumentDirectory())
                print(findDirectoryPath(target: "AllTextures"))
                do {
                    let contents = try fm.contentsOfDirectory(at: getDocumentDirectory(), includingPropertiesForKeys: [.nameKey, .pathKey]).map({$0.path()})
                    print(contents.filter({$0.contains("/AllTextures/")}))
                } catch {
                    print("Error when fetching contents of directory")
                }
            }
    }
}
