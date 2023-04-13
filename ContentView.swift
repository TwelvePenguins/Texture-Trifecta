import SwiftUI

struct ContentView: View {
    
    var body: some View {
        DesignEditView()
            .onAppear {
                print(getDocumentDirectory())
                createDirectory(name: "AllTextures", path: getDocumentDirectory())
                createDirectory(name: "PenguinTextures", path: getDocumentDirectory())
                do {
                    let contents = try fm.contentsOfDirectory(atPath: getDocumentDirectory().path())
                    print(contents)
                } catch {
                    print("Something went wrong")
                }
            }
    }
}
