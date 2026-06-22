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
            Image(systemName: "photo.artframe")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundStyle(.blue)
            
            Text("Artist")
            
            Text(artwork.artist_title ?? "Unknown Artist")
                .font(.headline)
            
            Text("Artwork ID: \(artwork.id)")
                .foregroundStyle(.secondary)
            
           
            
        }// Vstack ends
        .padding()
        .navigationTitle("Details")

    } // body views ends
    
} // struct ends

#Preview {
    ArtworkDetailView(
        artwork: Artwork(id: 1, title: "String", image_id: "String", artist_title: "String"
        )
    )
}
