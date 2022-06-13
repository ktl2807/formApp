//
//  movieList.swift
//  formApp
//
//  Created by sand liao on 20/05/2022.
//

import SwiftUI

struct MovieList: View {
    
    //var movies = [Movie(),Movie(),Movie()]
    @ObservedObject var movieStorage = MovieStorage()
    var body: some View {
        
        NavigationView{
            List{
                ForEach(Array(movieStorage.movies.enumerated()), id:\.offset){
                index, currentMovie in
                    NavigationLink(destination:ContentView(movie: currentMovie, newMovie: false, movieIndex: index, movieStorage:movieStorage)){
                    Text(currentMovie.title)
                }
                }.onDelete{ (index) in self.movieStorage.movies.remove(atOffsets: index)}
            }.navigationBarTitle("Your Movie List").navigationBarItems(trailing:NavigationLink(destination: ContentView(movie:Movie(), newMovie:true, movieIndex: -1, movieStorage:movieStorage)){
                Image(systemName: "plus")
            })
        }
        
    }
}
struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
