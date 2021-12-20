//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import Foundation


extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Couldn't decode \(file)")
        }
    
        return decoded
        
    
    }
}
