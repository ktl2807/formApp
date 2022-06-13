//
//  movie.swift
//  formApp
//
//  Created by sand liao on 20/05/2022.
//

import Foundation

struct Movie:Identifiable, Codable{
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seen = false
    
}

class MovieStorage: ObservableObject{
    @Published var movies = [Movie]()
    
    init(){
        if let data = UserDefaults.standard.data(forKey: "SaveData"){
            if let decoded = try? JSONDecoder().decode([Movie].self, from: data){
                movies = decoded
                return
            }
        }
        movies = []
    }
    
    func saveData(){
        if let encoded = try? JSONEncoder().encode(movies){
            UserDefaults.standard.set(encoded, forKey: "SaveData")        }
    }
}





