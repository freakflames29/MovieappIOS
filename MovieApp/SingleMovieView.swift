//
//  SingleMovieView.swift
//  MovieApp
//
//  Created by sourav das on 03/07/24.
//

import SwiftUI

struct SingleMovieView: View {
    let movie : MovieModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                ZStack(alignment: .bottomLeading){
                    Image(movie.img)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            if colorScheme == .dark
                            {
                                LinearGradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.2),
                                    Gradient.Stop(color: .black, location: 1)
                                
                                
                                ], startPoint: .top, endPoint: .bottom)
                            }else {
                                LinearGradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.2),
                                    Gradient.Stop(color: .white, location: 1)
                                
                                
                                ], startPoint: .top, endPoint: .bottom)
                            }
                        }
                    
                    VStack(alignment: .leading){
                        Text(movie.Title)
                            .font(.custom("NewsflashBB", size: 70))
                            .fontWeight(.black)
                            
//                            .padding(.leading,10)
                        HStack(){
                            Text(movie.Year + " • ")
                            Text(movie.Genre + " • ")
                            Text(movie.Runtime)
                            
                            
                        }
                        .foregroundColor(.gray)
                        
                       
                    }
                    .padding(.leading,20)
                    
                    
                }
                
                
                Button {
                    print("Playing the movie")
                }label:{
                    Label("Play now ",systemImage: "play.fill")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal,40)
                        .padding(.vertical,10)
                        .background(.red)
                        .cornerRadius(10)
                        
                    
                }.padding()
                  
                
                VStack(alignment: .leading){
                    Text(movie.Plot)
                        .padding(.horizontal,10)
                    Text("Actors")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(.all, 10)
                    
                    Text(movie.Actors)
                        .padding(.leading,10)
                    
                }.padding(.leading,10)
                
              
                
            }.ignoresSafeArea()
           
            
        }
    }
}

#Preview {
    SingleMovieView(movie : MovieController().movies[0])
}
