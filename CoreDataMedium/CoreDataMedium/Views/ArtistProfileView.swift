//
//  ArtistProfileView.swift
//  CoreDataMedium
//
//  Created by Jonas Fernando Nascimento Melo on 07/08/25.
//

import SwiftUI

struct ArtistProfileView: View {
    
    let artist: Artist?
    @State var albums: [Album] = []
    
    @ObservedObject var viewModel = CoreDataViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                List($albums, id: \.self){ album in
                    
                    Section{
                        AlbumComponent(album: album, viewModel: viewModel)
                        
                    }
                    
                }
                .onAppear{
                    albums = viewModel.convertArtistAlbumArray(artist: artist!)
                    
                }
            }
            
        }
    }
}

//#Preview {
//    ArtistProfileView()
//}
