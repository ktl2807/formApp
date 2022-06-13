//
//  ContentView.swift
//  formApp
//
//  Created by sand liao on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var movie:Movie
    @Environment(\.presentationMode) var presentationMode
    let newMovie : Bool
    let movieIndex: Int
    @ObservedObject var movieStorage: MovieStorage
    
    
    var body: some View {
        List{
            Section{
                SectionTitle(title: "Movie Title")
                TextField("movie name", text:$movie.title)
            }
            Section{
                SectionTitle(title: "Rating")
                HStack{
                    Text(String(repeating:"*", count:Int(movie.rating)))
                        .font(.title)
                        .foregroundColor(Color.yellow)
                }
                Slider(value:$movie.rating, in:0...5, step: 1)
            }
            Section{
                SectionTitle(title: "Have You Seen it?")
                Toggle(isOn: $movie.seen){
                    if(movie.seen){
                        Text("Seen")
                    }else{
                        Text("Not Seen")
                    }
                }
            }
            Section{
                Button(action:{
                    if (newMovie){
                        movieStorage.movies.append(movie)
                        movieStorage.saveData()
                    }
                    self.presentationMode.wrappedValue.dismiss()}){
                    HStack{
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
            }
            if(!newMovie){
                Section{
                    Button(action:{
                        if !newMovie{
                            print(movie.id)
                            movieStorage.movies.remove(at: movieIndex)
                            movieStorage.saveData()
                        }
                    }){
                        HStack{
                            Spacer()
                            Text("Delete")
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
struct SectionTitle:View{
    var title:String
    var body: some View {
        Text(title).font(.caption).fontWeight(.bold).foregroundColor(Color.gray)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movie: Movie(),newMovie: true, movieIndex:0, movieStorage: MovieStorage())
    }
}
