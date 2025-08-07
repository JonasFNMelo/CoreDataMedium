import SwiftUI
import PhotosUI

struct CreatAlbumView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var albumName: String = ""
    @State var numSongs: Int16 = 0
    @State var albumImage: UIImage?
    @State var pikerItem: PhotosPickerItem?
    @State var artist: Artist?
    
    @ObservedObject var viewModel: CoreDataViewModel
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    TextField("album Name", text: $albumName)
                    
                    VStack(alignment: .leading){
                        PhotosPicker("Select the album photo", selection: $pikerItem, matching: .images)
                        
                        Image(uiImage: albumImage ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                        
                    }
                    
                    Picker("Choose artist", selection: $artist){
                        ForEach(viewModel.artists){ art in
                            Text(art.artistName ?? "").tag(art)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .onChange(of: pikerItem) {
                Task {
                    if let loaded = try? await pikerItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: loaded){
                            albumImage = uiImage
                            return
                        }
                        
                    } else {
                        print("Failed")
                    }
                }
            }
            .navigationTitle("Creat Album")
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
                        
                        viewModel.createAlbum(albumName: albumName, artist: artist!, albumPhoto: albumImage! )
                    
                        dismiss()
                    }
                    .disabled(albumName == "" ? true : false)
                    .disabled(albumImage == nil ? true : false)
                    .disabled(artist == nil ? true : false)
                    
                    
                }
            }
        }
        
    }
    
}

#Preview {
    
    @ObservedObject var viewModel = CoreDataViewModel()
    CreatAlbumView(viewModel: viewModel)
}
