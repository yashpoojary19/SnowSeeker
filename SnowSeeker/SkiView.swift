//
//  SkiView.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI

struct SkiView: View {
    let resort: Resort
    var body: some View {
        Group {
            Text("Elevation: \(resort.elevation)m")
                .layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Snow: \(resort.snowDepth)m")
                .layoutPriority(1)
        }
    }
}


struct SkiView_Previews: PreviewProvider {
    static var previews: some View {
        SkiView(resort: Resort.example)
    }
}
