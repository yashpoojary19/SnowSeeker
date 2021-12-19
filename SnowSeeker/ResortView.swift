//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI

struct ResortView: View {
    
    let resort: Resort
    
    @State private var selectedFacility: Facility?
    @Environment(\.horizontalSizeClass) var sizeClass
    @EnvironmentObject var favorites: Favorites
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0){
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    HStack {
                        
                        if sizeClass == .compact {
                            Spacer()
                            VStack {
                                ResortDetailsView(resort: resort)
                            }
                            VStack {
                                SkiView(resort: resort)
                            }
    
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiView(resort: resort)
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    selectedFacility = facility
                                }
                        }
                    }
                }
                .padding(.horizontal)
                
                Button(favorites.contains(resort) ? "Remove from favorite": "Add to favorites") {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                }
                .padding()
            }
            .navigationBarTitle(Text("\(resort.name), \(resort.country)"))
            .navigationBarTitleDisplayMode(.inline)
            .alert(item: $selectedFacility) { facility in
                facility.alert
            }
        }
    }
    
}
extension String: Identifiable {
    public var id: String { self }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example).previewInterfaceOrientation(.landscapeLeft)
    }
}
