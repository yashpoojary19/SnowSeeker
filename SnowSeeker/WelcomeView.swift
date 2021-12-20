//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.title)
            
            Text("Please select a resort from the left hand menu; swipe from the left edge to show it")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
