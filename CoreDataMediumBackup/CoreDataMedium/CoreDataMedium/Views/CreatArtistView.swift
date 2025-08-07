//
//  CreatArtistView.swift
//  CoreDataMedium
//
//  Created by Jonas Fernando Nascimento Melo on 06/08/25.
//

import SwiftUI

struct CreatArtistView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var artistName: String = ""
    @State var artistDesc: String = ""
    
    @ObservedObject var viewModel: CoreDataViewModel
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    TextField("Artist Name", text: $artistName)
                    TextField("Artist Description", text: $artistDesc)
                    
                }
            }
            .navigationTitle("Creat artist")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)

                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        viewModel.createArtists(artistName: artistName, artistDesc: artistDesc)
                        dismiss()
                    }
                    .disabled(artistName == "" ? true : false)
                    .disabled(artistDesc == "" ? true : false)

                }
            }
        }
        
    }
    
}

#Preview {
    
    @ObservedObject var viewModel = CoreDataViewModel()
    CreatArtistView(viewModel: viewModel)
}
