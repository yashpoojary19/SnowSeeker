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
            fatalError("Not able to locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Not able to load \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Not able to decode \(file)")
        }
        
        return decoded
       
    }

}
