//
//  ContentView.swift
//  MovieApp
//
//  Created by sourav das on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    var allMovies = MovieController()
    
    @State var searchText = ""
    
    @State var sortByYear : Bool = false
    
    @State var toolBarFilter : MovieModel.MovieType = .all
    
    var moviesFiltered : [MovieModel] {
        
        allMovies.filter(by: toolBarFilter)
        allMovies.sort(year: sortByYear)
        return allMovies.search(searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(moviesFiltered) { movie in
                NavigationLink{
                    SingleMovieView(movie: movie)
                } label:{
                    
                    
                    
                    HStack{
                        // img
                        
                        Image(movie.img)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .cornerRadius(10)
                        //                        .shadow(color: .gray, radius: 5)
                        
                        
                        VStack(alignment: .leading){
                            Text(movie.Title)
                                .font(.system(size: 20))
                                .bold()
                               
                            
                            HStack {
                                Text("★ " + movie.imdbRating)
                                    .padding(.horizontal,10)
                                    .padding(.vertical,5)
                                
                                    .background(movie.ratingColor)
                                    .cornerRadius(5)
                                    .foregroundColor(.black)
                                
                                //                            Text(movie.Rated)
                            }
                            
                        }.padding(.leading,10)
                    }
                    
                }
                
            }
            .navigationTitle("Movie Pedia")
            .searchable(text: $searchText)
            .animation(.bouncy,value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation{
                            self.sortByYear.toggle()
                        }
                    }label: {
                        Image(systemName: sortByYear ? "calendar" : "textformat")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Type Filter",selection: $toolBarFilter.animation()) {
                            ForEach(MovieModel.MovieType.allCases,id:\.self) { mtype in
                                    
                                Label(mtype.rawValue.capitalized,systemImage: mtype.imgIcon)
                                
                            }
                        }
                        
                    } label: {
                        Image(systemName: "filemenu.and.selection")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
