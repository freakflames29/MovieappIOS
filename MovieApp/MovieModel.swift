//
//  MovieModel.swift
//  MovieApp
//
//  Created by sourav das on 03/07/24.
//

import Foundation
import SwiftUI

struct MovieModel: Decodable, Identifiable {
//    var id =  UUID()
    
  
//    var id: MovieModel {self}
    var id : Int
    let Title :  String
    let Year : String
    let Rated : String
    let Released : String
    let Runtime : String
    let Genre : String
    let Director : String
    let Actors : String
    let Plot: String
    let Language : String
    let Country : String
    let Awards : String
    let Poster: String
    let Ratings : [RatingList]
    
    
    
    
    let Metascore : String
    let imdbRating : String
    let imdbVotes : String
    
    let `Type`: MovieType
    let BoxOffice : String
    let Response : String
    
    
    var img : String {
        self.Title.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    // converting string year to int year
    
    var IntYear : Int {
        Int(self.Year) ?? 1
    }
    
    var ratingColor : Color {
        let convertedRating : Double = Double(self.imdbRating) ?? 1.1
        
        if convertedRating > 6 && convertedRating < 8{
            return .yellow
        }
        else if convertedRating > 8 {
            return .green
        }
        else {
            return .red
        }
        
    }
    
    struct RatingList : Decodable {
        let Source : String
        let Value : String
    }
    
    enum MovieType : String, Decodable ,CaseIterable{
        case all
        case series
        case movie
        
        var imgIcon : String {
            switch self {
                case .movie:
                    "movieclapper"
                case .series:
                    "popcorn"
                case .all :
                    "film.stack.fill"
            }
        }
    }
}
