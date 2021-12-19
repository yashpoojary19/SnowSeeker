//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import SwiftUI

class Favorites: ObservableObject {
    private var resorts: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        
        resorts = []
    }
    
    func save(_ resort: Resort) {
        //
    }
    
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
//        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
//        save()
    }
    
    
}
