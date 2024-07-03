//
//  MovieController.swift
//  MovieApp
//
//  Created by sourav das on 03/07/24.
//

import Foundation
import SwiftUI

class MovieController {
    
    var movies : [MovieModel ]  = []
    
    var allMovies : [MovieModel] = []
    
    init(){
        decodeMovie()
    }
    
    func decodeMovie (){
        if let url = Bundle.main.url(forResource: "moviedata", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allMovies = try decoder.decode([MovieModel].self, from: data)
                movies = allMovies
            }catch {
                print("Unable to decode the data : \(error)")
            }
        }
        else {
            print("Unable to find the data file")
        }
    }
    
    func search(_ searchTerm : String) -> [MovieModel]{
        if searchTerm.isEmpty{
            return movies
        }
        else {
            return movies.filter { movie in
                movie.Title.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(year: Bool ) {
        if year {
            movies.sort(by: {$0.IntYear < $1.IntYear})
        }
        else {
            movies.sort(by: {$0.Title < $1.Title})
        }
    }
    func filter(by movieType: MovieModel.MovieType ) {
        if movieType == .all{
            movies = allMovies
            
        }
        else {
            movies = allMovies.filter{ movie in
                movie.Type == movieType
                
            }
        }
    }
    
}
