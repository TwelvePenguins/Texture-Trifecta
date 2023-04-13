import SwiftUI

struct ContentView: View {
    
    var body: some View {
        DesignEditView()
            .onAppear {
                print(getDocumentDirectory())
                
                createDirectory(name: "AllTextures", path: getDocumentDirectory())
                createDirectory(name: "PenguinTextures", path: getDocumentDirectory())
                print(findDirectoryURL(target: "AllTextures"))
                
//                let data: Data = "Penguin".data(using: .utf8)!
                let data = UIImage(named: "a", in: nil, with: .none)?.pngData()
                print(addImage(data: data!, targetDirectoryName: "AllTextures"))
            }
    }
}
