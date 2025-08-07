//
//  PickerArtist.swift
//  CoreDataMedium
//
//  Created by Jonas Fernando Nascimento Melo on 06/08/25.
//

import SwiftUI

struct PickerArtist: View {
    
    @Binding var artist: Artist?
    @ObservedObject var viewModel: CoreDataViewModel
    
    var body: some View {
        Form{
            Picker("Choose artist", selection: $artist){
                ForEach(viewModel.artists){ art in
                    Text(art.artistName ?? "")
                }
            }
            .pickerStyle(.menu)
        }
    }
}

//#Preview {
//    PickerArtist()
//}
