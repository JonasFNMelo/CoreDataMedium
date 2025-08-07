//
//  ContentView.swift
//  CoreDataMedium
//
//  Created by Jonas Fernando Nascimento Melo on 06/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = CoreDataViewModel()
    
    @State var artistShowSheet: Bool = false
    @State var albumShowSheet: Bool = false
    @State var songShowSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack(spacing: 40){
                    
                    Button {
                        artistShowSheet.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .bold()
                            .font(.largeTitle)
                    }
                    
                    Button {
                        albumShowSheet.toggle()
                    } label: {
                        Image(systemName: "books.vertical.fill")
                            .bold()
                            .font(.largeTitle)
                    }
                    
                    Button {
                        songShowSheet.toggle()
                    } label: {
                        Image(systemName: "music.note")
                            .bold()
                            .font(.largeTitle)
                    }
                }
                
                List(viewModel.artists){
                    art in
                    NavigationLink(art.artistName ?? ""){
                        ArtistProfileView(artist: art, viewModel: viewModel )
                    }
                }
                
                
            }
            .sheet(isPresented: $artistShowSheet){
                CreatArtistView(viewModel: viewModel)
            }
            .sheet(isPresented: $albumShowSheet){
                CreatAlbumView(viewModel: viewModel)
            }
            .sheet(isPresented: $songShowSheet){
                CreatSongView(viewModel: viewModel)
            }
            .onAppear{
                viewModel.getSongs()
                viewModel.getAlbums()
                viewModel.getArtists()
            }
            .onChange(of: artistShowSheet){
                viewModel.getSongs()
                viewModel.getAlbums()
                viewModel.getArtists()
                
            }.onChange(of: songShowSheet){
                viewModel.getSongs()
                viewModel.getAlbums()
                viewModel.getArtists()
                
            }.onChange(of: albumShowSheet){
                viewModel.getSongs()
                viewModel.getAlbums()
                viewModel.getArtists()
            }
            .padding()
        }
    }
    
}

#Preview {
    ContentView()
}
