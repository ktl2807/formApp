//
//  ImageView.swift
//  formApp
//
//  Created by Hemil Patel on 5/27/22.
//

import SwiftUI



struct ImageView: View {
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()

    var body: some View {
        
        HStack {
            Button(action:{
                changeProfileImage = true
                openCameraRoll = true
                
                
            }){
                if( changeProfileImage){
                    Image(uiImage: imageSelected).resizable().frame(width: 200, height: 200).clipShape(Circle())
                } else {
                    Image(systemName: "person.fill.badge.plus").resizable().frame(width: 100, height: 100)
                }

                
                
            }.sheet(isPresented: $openCameraRoll){
                ImagePicker( selectedImage: $imageSelected, sourceType: .photoLibrary)
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
