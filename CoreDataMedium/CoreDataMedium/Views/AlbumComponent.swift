//
//  AlbumComponent.swift
//  CoreDataMedium
//
//  Created by Jonas Fernando Nascimento Melo on 07/08/25.
//

import SwiftUI

struct AlbumComponent: View {
    
    @State var myImage: Image?
    @Binding var album: Album
    @State var songs: [Song] = []
    
    @ObservedObject var viewModel = CoreDataViewModel()
    
    
    var body: some View {
        VStack{
            
            myImage?
                .resizable()
                .scaledToFit()
            
            Text("Album name: \(album.albumName!)")
            
            ForEach(songs, id: \.self){ song in
                
                
                Text("Song name: \(song.songName ?? "")")
                
                
            }
            
        }
        .onAppear{
            myImage = viewModel.creatUIImage(data: album.albumPhoto!)
            songs = viewModel.convertAlbumSongArray(album: album)
            
        }
        
    }
}

//#Preview {
//    AlbumComponent()
//}
