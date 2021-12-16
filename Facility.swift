//
//  Facility.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI

struct Facility: Identifiable {
    
    let id = UUID()
    
    var name: String
    
    var icon: some View {
        let icons = [
            "Accommodation": "house",
            "Beginners": "1.circle",
            "Cross-country": "map",
            "Eco-friendly": "leaf.arrow.circlepath",
            "Family": "person.3"
        ]
        
        if let iconName = icons[name] {
            let image = Image(systemName: iconName)
                .accessibilityLabel(Text(name))
                .foregroundColor(.secondary)
            
            return image
        } else {
            fatalError("Unkown facility type: \(name)")
        }
    }
    
    var alert: Alert {
        let messages = [
            "Accommodation": "This resort has popular resort accomodations.",
            "Beginners": "This resort has lot of ski schools.",
            "Cross-country": "This resort has many cross country ski routes.",
            "Eco-friendly": "This resort is eco-friendly.",
            "Family": "This resort is popular with family"
        ]
        
        if let message = messages[name] {
            return  Alert(title: Text(name), message: Text(message))
        } else {
            fatalError("Unkown facility type: \(name)")
        }
    }
}
