    //
    //  ArtworkListView.swift
    //  ArtInstitute
    //
    //  Created by Syed Fahad Rasheed on 2026-06-18.
    //

    import SwiftUI
   // Main screen displaying a searchable collection of artworks
    struct ArtworkListView: View {
        @StateObject private var store = ArtworkStore()
        @State private var searchText = ""
        // Filters artworks based on the user's search text
        var filteredArtworks: [Artwork] {
            
            if searchText.isEmpty {
                return store.artworks
            }
            return store.artworks.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                                ($0.artist_title ?? "")
                    .localizedCaseInsensitiveContains(searchText)

            }

        }
        var body: some View {
            NavigationStack{
                if store.isLoading {
                    ProgressView("Loading please wait")
                
                }else{
                    List(filteredArtworks) { artwork in
                        NavigationLink(
                           destination: ArtworkDetailView(
                                        artwork: artwork))
                        {
                          HStack {
                        Image(systemName: "photo.artframe")
                                  .font(.largeTitle)
                                  .foregroundStyle(.blue)
                        VStack(alignment: .leading) {
                            Text(artwork.title)
                                 .font(.headline)
                            Text(artwork.artist_title ?? "Unknown Artist")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                }
                                
                            }
                        }
                        
                    } // list
                    // Allows users to refresh artwork data with a pull-down 
                    .refreshable {
                        store.fetchArtworks()
                    }
                    
                    .searchable(text: $searchText)
                    .navigationTitle("Art Institute")
                    .toolbar{
                        NavigationLink(destination: AboutView()){
                            Image(systemName: "info.circle")
                        }
                    }
                    .alert(
                        "Error",
                        isPresented: $store.showError)
                    {
                            Button("OK"){ }
                            } message: {
                                Text(store.errorMessage)
                }
              }
            }
        } // body
    } // struct

    #Preview {
        ArtworkListView()
    }
