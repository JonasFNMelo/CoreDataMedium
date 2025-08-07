import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    @Published var songs: [Song] = []
    @Published var albums: [Album] = []
    @Published var artists: [Artist] = []

    //Song
    func getSongs() {
        songs = CoreDataModel.shared.fetchAllSongs()
    }
    
    func createSong(songName: String, artists: [Artist]) {
        let result = CoreDataModel.shared.createSong(songName: songName, artists: artists)
        self.songs.append(result)
    }
    
    func updateSongAlbum(song: Song, album: Album){
        CoreDataModel.shared.updateSongAlbum(song: song, album: album)
    }

    func deleteSong(_ song: Song) {
        CoreDataModel.shared.deleteSong(song)
    }
    
    // Album
    func getAlbums() {
        albums = CoreDataModel.shared.fetchAllAlbums()
    }
    
    func createAlbum(albumName: String, artist: Artist, albumPhoto: UIImage) {
        if let photo = albumPhoto.jpegData(compressionQuality: 1.0) {
            print(photo)
            let result = CoreDataModel.shared.createAlbum(albumName: albumName, artist: artist, albumPhoto: photo)
            self.albums.append(result)
        }
    }
    
    func updateAlbumSongs(songs: [Song], album: Album){
        CoreDataModel.shared.updateAlbumSongs(songs: songs, album: album)
    }
    
    func creatUIImage(data: Data) -> Image{
        let image = UIImage(data: data)!
        let result = Image(uiImage: image)
        return result
    }
    
    func convertAlbumSongArray(album: Album) -> [Song]{
        let songs = album.songs.flatMap {
            $0.allObjects as? [Song]
        }
        
        return songs ?? []
    }

    func deleteAlbum(_ album: Album) {
        CoreDataModel.shared.deleteAlbum(album)
    }
    
    // Artist
    func getArtists() {
        artists = CoreDataModel.shared.fetchAllArtist()
    }
    
    func createArtists(artistName: String, artistDesc: String) {
        let result = CoreDataModel.shared.createArtist(artistName: artistName, artistDesc: artistDesc)
        self.artists.append(result)
    }
    
    func convertArtistSongArray(artist: Artist) -> [Song]{
        let songs = artist.songs.flatMap {
            $0.allObjects as? [Song]
        }
        
        return songs ?? []
    }
    
    func convertArtistAlbumArray(artist: Artist) -> [Album]{
        let album = artist.albuns.flatMap {
            $0.allObjects as? [Album]
        }
        
        return album ?? []
    }
    
    func deleteArtist(_ artist: Artist) {
        CoreDataModel.shared.deleteArtist(artist)
    }
    
}

