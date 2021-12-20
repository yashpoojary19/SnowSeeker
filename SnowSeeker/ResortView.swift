//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI

struct ResortView: View {
    
    let resort: Resort
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var selectedFacility: Facility?
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        ScrollView {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Image(decorative: resort.id)
                            .resizable()
                            .scaledToFit()
                        
                        Text("Photo credits: \(resort.imageCredit)")
                            .padding(.horizontal)
                            .font(.headline)
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)

                            
                            
                    }
                    
                    
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
                            ForEach(resort.facilityTypes) { facility  in
                                facility.icon
                                    .font(.title)
                                    .onTapGesture {
                                        selectedFacility = facility
                                    }
                            }
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    
                    Button(favorites.contains(resort) ? "Remove from favorites" : "Add to favorites") {
                            if favorites.contains(resort) {
                                favorites.remove(resort)
                            } else {
                                favorites.add(resort)
                            }
                    }
                    
                }
                .navigationTitle("\(resort.name), \(resort.country)")
                .navigationBarTitleDisplayMode(.inline)
                .alert(item: $selectedFacility) { facility in
                    facility.alert
            }
        }
    }
    
}


struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
