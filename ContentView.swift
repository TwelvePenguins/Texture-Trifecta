import SwiftUI

struct ContentView: View {
    @StateObject var designsManager = DesignsManager()
    
    var body: some View {
        DesignEditView(manager: DesignsManager())
            .onAppear {
                //Initialising the array in the plist
                if designsManager.sections.isEmpty {
                    designsManager.sections = [
                        Section(name: "PenguinTorso", shape: .Torso),
                        Section(name: "PenguinBelly", shape: .Belly),
                        Section(name: "PenguinEye", shape: .Eye),
                        Section(name: "PenguinFlipper", shape: .Flipper),
                        Section(name: "PenguinLFoot", shape: .LFoot),
                        Section(name: "PenguinRFoot", shape: .RFoot),
                        Section(name: "PenguinBeak", shape: .Beak)
                    ]
                }
            }
    }
}
