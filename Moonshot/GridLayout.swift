//
//  GridLayout.swift
//  Moonshot
//
//  Created by Marc-Developer on 9/6/22.
//

import SwiftUI

let columns = [
    GridItem(.adaptive(minimum: 150))
]

struct GridLayout: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        Text("Select A Mission")
            .font(.largeTitle)
            .padding()
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(mission.shortFormattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground))
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        GridLayout(astronauts: astronauts, missions: missions)
    }
}
