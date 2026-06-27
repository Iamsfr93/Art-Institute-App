//
//  ArtworkDetailView.swift
//  ArtInstitute
//
//  Created by Syed Fahad Rasheed on 2026-06-20.
//

import SwiftUI


struct ArtworkDetailView: View {
    
    let artwork: Artwork

    
    var body: some View {
        VStack(spacing: 10){
            Text(artwork.title)
                .font(.title)
                .fontWeight(.bold)
            // Placeholder image displayed
            if let image_id = artwork.image_id {
                
                let imageURL = URL(
                string : "https://www.artic.edu/iiif/2/\(image_id)/full/843,/0/default.jpg")
                AsyncImage(url: imageURL) { phase in
                    
                    switch phase{
                    case .empty:
                        ProgressView()
                        
                    
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(25)
                        
                    case .failure(_):
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundStyle(Color.gray)
                        
                    @unknown  default:
                        EmptyView()
                        
                    }
                }
                
                
            }
            
            else{
                Image(systemName:"photo.artframe")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(Color.gray)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 15){
                
                
                HStack{
                    Image(systemName: "person")
                        .foregroundStyle(.blue)
                    
                    Text("Artist")
                        .font(.headline)
                        
                }
                
                Text(artwork.artist_title ?? "Unknown Artist")
                Divider()
                
                
                HStack {
                    Image(systemName: "number.square")
                        .foregroundStyle(.blue)

                    Text("Artwork ID")
                        .font(.headline)

                }


                
                
                Text("\(artwork.id)")
                    .foregroundStyle(.secondary)
                Divider()
                
                HStack {
                Image(systemName: "building.columns.fill")
                        .foregroundStyle(.blue)

                Text("Museum")
                        .font(.headline)
                    }

                Text("Art Institute of Chicago")
                    .foregroundStyle(.secondary)

                
            }
            
        }// Vstack ends
        .padding()
        .navigationTitle("Details")

    } // body views ends
    
} // struct ends

#Preview {
    ArtworkDetailView(
        artwork: Artwork(
            id: 1,
            title: "String",
            image_id: "123",
            artist_title: "String",
            thumbnail: nil
        )
    )
}
