//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @ObservedObject var favorites = Favorites()
    
    
    
    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                            
                        
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                        
                        }.layoutPriority(1)
                    
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel(Text("This is a favorite resort"))
                                .foregroundColor(.red)
                        }
                    }
            }
            .navigationBarTitle("Resorts")
            
            WelcomeView()
        }
        .environmentObject(favorites)
      
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
