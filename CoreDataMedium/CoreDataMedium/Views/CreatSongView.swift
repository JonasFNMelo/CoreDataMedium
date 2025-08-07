import SwiftUI

struct CreatSongView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var songName: String = ""
    @State var artist = Set<Artist>()
    @State var album: Album?
    @State private var isEditMode: EditMode = .active
    
    
    @ObservedObject var viewModel: CoreDataViewModel
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    TextField("Song Name", text: $songName)
                    
                    NavigationView{
                        List(viewModel.artists, id: \.self, selection: $artist) { art in
                            Text(art.artistName ?? "")
                        }
                        
                        .environment(\.editMode, self.$isEditMode)
                    }
                    
                    Picker("Choose Album", selection: $album){
                        ForEach(viewModel.albums){ album in
                            Text(album.albumName ?? "").tag(album)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Creat Song")
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
                        viewModel.createSong(songName: songName, artists: Array(artist))
                        if album != nil{
                            viewModel.updateSongAlbum(song: viewModel.songs.last!, album: album!)
                        }

                        dismiss()
                    }
                    .disabled(songName == "" ? true : false)
                }
            }
            
        }
        
    }
    
}

#Preview {
    
    @ObservedObject var viewModel = CoreDataViewModel()
    CreatSongView(viewModel: viewModel)
}
