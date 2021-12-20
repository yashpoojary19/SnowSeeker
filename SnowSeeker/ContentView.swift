//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI

enum ResortSorting {
    case Default, Alphabetical, Country
}


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @ObservedObject var favorites = Favorites()

    @State private var sorted: ResortSorting = .Default
    @State private var showingSort = false
    @State private var showingFilter = false
    
    @State private var selectedFilter = 0
    
    @State private var filteredResorts = [Resort]()

    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredResorts) { resort in
                    NavigationLink(destination: ResortView(resort: resort)) {
                        HStack {
                            Image(resort.country)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 20)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(resort.name)
                                    .font(.headline)

                                    
                                    
                                
                                Text("\(resort.runs) runs")
                                    .foregroundColor(.secondary)
                            }
                            .layoutPriority(1)
                            
                          
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel(Text("This is a favorite resort."))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showingSort.toggle()
                    }) {
                        Image(systemName: "arrow.up.arrow.down.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingFilter.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                }
            }
            .navigationBarTitle("Resorts")
            .confirmationDialog("Filter by size", isPresented: $showingFilter) {
                Button("Small") {
                    selectedFilter = 1
                    filterAndSort()
                }
                Button("Average") {
                    selectedFilter = 2
                    filterAndSort()
                }
                Button("Large") {
                    selectedFilter = 3
                    filterAndSort()
                }
                Button("All") {
                    selectedFilter = 0
                    filterAndSort()
                }
                
                
                
            }
            .confirmationDialog("Sorty by", isPresented: $showingSort) {
                Button("Default") {
                    sorted = .Default
                    filterAndSort()
                }
                Button("Alphabetical") {
                    sorted = .Alphabetical
                    filterAndSort()
                }
                Button("Country") {
                    sorted = .Country
                    filterAndSort()
                }
                
                
            }
            
            
            
            
            
            WelcomeView()
        }
        .environmentObject(favorites)
        .onAppear {
            filteredResorts = resorts
        }
        
    }
    
    func filterAndSort() {
        switch sorted {
        case .Default:
            filteredResorts = resorts
        case .Alphabetical:
            filteredResorts = resorts.sorted(by: { $0.name < $1.name })
        case .Country:
            filteredResorts = resorts.sorted(by: { $0.country < $1.country })
        }
        
        if selectedFilter > 0 {
            filteredResorts = filteredResorts.filter {
                $0.size == selectedFilter
            }
        }
    }
}

extension View {
    func phoneOnlyStackedNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//extension View {
//    func phoneOnlyStackedNavigationView() -> some View {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return AnyView(navigationViewStyle(StackNavigationViewStyle()))
//        } else {
//            return AnyView(self)
//        }
//    }
//}
//struct UserView: View {
//    var body: some View {
//        Group {
//            Text("Name: Paul")
//            Text("Country: England")
//            Text("Pets: Luna, Arya, and Toby")
//        }
//    }
//}
//
//
//
//struct ContentView: View {
//    @Environment(\.horizontalSizeClass) var sizeClass
//
//    var body: some View {
//        Group {
//            if sizeClass == .compact {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//    }
//}

//struct User: Identifiable {
//    var id = "Yash Poojary"
//}
//
//
//
//
//struct ContentView: View {
//
//    @State private var selectedUser: User? = nil
//
//    @State private var isShowingAlert = false
//
//    var body: some View {
//        Text("Hello World!")
//            .onTapGesture {
//                selectedUser = User()
//
//                isShowingAlert = true
//            }
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text(selectedUser!.id))
//            }
//    }
//}



//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//                NavigationLink(destination: Text("Wowza")) {
//                Text("Hello World")
//            }
//                .navigationTitle("Wow")
//
//            Text("Second hoon mein")
//        }
//    }
//}
