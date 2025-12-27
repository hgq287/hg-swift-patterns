//
//  ContentView.swift
//  Sample
//
//  Created by Hg Q. on 27/12/25.
//

import SwiftUI
import AbstractDocument

protocol HasModel: IAbstractDocument {}
extension HasModel {
    var model: String {
        get { get("model") as? String ?? "" }
    }
    
}

class Computer: AbstractDocument, HasModel {}

@Observable
class CompanyInteractor {
    private(set) var laptop: Computer
    private(set) var version: Int = 0
    
    init() {
        // Initial state
        self.laptop = Computer(properties: ["model": "Macbook Pro M2"])
    }
    
    func upgradeHardware() {
        laptop.put("model", value: "Macbook Pro M4 2025")
        version += 1
    }
}

struct ContentView: View {
    @State private var interactor = CompanyInteractor()
    var body: some View {
        VStack(spacing: 20) {
            Text("Company Devices")
                .font(.headline)
            HStack {
                Text("Model:")
                Text(interactor.laptop.model)
                    .fontWeight(.bold)
            }
            .id(interactor.version)
            
            Button("Upgrade Devices") {
                interactor.upgradeHardware()
            }
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

#Preview {
    ContentView()
}
