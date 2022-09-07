//
//  CrewView.swift
//  Moonshot
//
//  Created by Marc-Developer on 9/6/22.
//

import SwiftUI

struct CrewView: View {
    let mission: Mission
    let crew: [Mission.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        VStack {
                            VStack {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                                )
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(20)
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let crew: [Mission.CrewMember] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        CrewView(mission: missions[2], crew: crew)
                .preferredColorScheme(.dark)
    }
}
