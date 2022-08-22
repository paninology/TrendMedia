//
//  Movie.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/20.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String
    let runtime: Int
    let overview: String
    let rate: Double
}

class User {
   init(name: String, age: Int, rate: Double, gender: Bool) {
        self.name = name
        self.age = age
        self.rate = rate
        self.gender = gender
    }
    
    let name: String
    let age: Int
    let rate: Double
    let gender: Bool
   
    
    
}

