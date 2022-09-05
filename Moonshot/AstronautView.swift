//
//  AstronautView.swift
//  Moonshot
//
//  Created by Marc-Developer on 9/4/22.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView {
                Text(astronaut.name)
                    .font(.largeTitle)
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(.bottom)
            VStack(alignment: .leading) {
                Text(astronaut.description)
            }
            .padding(10)
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}
