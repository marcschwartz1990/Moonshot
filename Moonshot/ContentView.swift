//
//  ContentView.swift
//  Moonshot
//
//  Created by Marc-Developer on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    @State private var listViewText = "Show as List"
    @State private var gridViewText = "Show in Grid"
    
    var body: some View {
        Group {
            if showingGrid {
                GridLayout(astronauts: astronauts, missions: missions)
            } else {
                ListLayout(astronauts: astronauts, missions: missions)
            }
        }
        .navigationTitle("Moonshot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(showingGrid ? listViewText : gridViewText) {
                    showingGrid.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
