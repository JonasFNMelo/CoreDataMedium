import CoreData
import Foundation

class CoreDataModel {
    static let shared = CoreDataModel()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
            
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    // Songs
    func createSong(songName: String, artists: [Artist]) -> Song {
        let song = Song(context: viewContext)
        
        song.songName = songName
        song.songID = UUID()
        song.artists = NSSet(array: artists)
        
        saveContext()
        return song
    }
    
    func updateSongAlbum(song: Song, album: Album){
        song.album = album
        
        saveContext()
    }
    
    func fetchAllSongs() -> [Song] {
        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching Songs: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteSong(_ song: Song) {
        viewContext.delete(song)
        
        saveContext()
    }
    
    // Albuns
    func createAlbum(albumName: String, artist: Artist, albumPhoto: Data) -> Album {
        let album = Album(context: viewContext)
        
        album.albumName = albumName
        album.albumID = UUID()
        album.albumPhoto = albumPhoto
        
        album.artist = artist
        
        saveContext()
        return album
    }
    
    func updateAlbumSongs(songs: [Song], album: Album){
        album.songs = NSSet(array: songs)
        
        saveContext()
    }
    
    func fetchAllAlbums() -> [Album] {
        let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching Album: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteAlbum(_ album: Album) {
        viewContext.delete(album)
        
        saveContext()
    }
    
    // Artist
    func createArtist(artistName: String, artistDesc: String) -> Artist {
        let artist = Artist(context: viewContext)
        
        artist.artistName = artistName
        artist.artistID = UUID()
        artist.artistDesc = artistDesc
        
        saveContext()
        return artist
    }
    
    func fetchAllArtist() -> [Artist] {
        let fetchRequest: NSFetchRequest<Artist> = Artist.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching Artists: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteArtist(_ artist: Artist) {
        viewContext.delete(artist)
        
        saveContext()
    }
}
