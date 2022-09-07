//
//  ListLayout.swift
//  Moonshot
//
//  Created by Marc-Developer on 9/6/22.
//

import SwiftUI

struct ListLayout: View {
    
    var astronauts: [String: Astronaut]
    var missions: [Mission]
    
    var body: some View {
        Text("Select A Mission")
            .font(.largeTitle)
            .padding()
        
        NavigationView {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65)
                            
                            Spacer()
                            
                            VStack {
                                Text("\(mission.displayName)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text("\(mission.shortFormattedLaunchDate)")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .frame(width: 120, height: 65, alignment: .center)
                            .padding()
                            .multilineTextAlignment(.center)
                        }
                    }
//                    .overlay(RoundedRectangle(cornerRadius: 10)
//                        .stroke(.lightBackground))
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}


struct ListLayout_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
    }
}
