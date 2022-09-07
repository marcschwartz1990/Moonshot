//
//  Mission.swift
//  Moonshot
//
//  Created by Marc-Developer on 9/2/22.
//

import Foundation



struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    struct CrewMember: Codable {
        let role: String
        let astronaut: Astronaut
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var shortFormattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var longFormattedLaunchDate: String {
        launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
}
