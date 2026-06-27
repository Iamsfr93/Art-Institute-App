//
//  AboutView.swift
//  ArtInstitute
//
//  Created by Syed Fahad Rasheed on 2026-06-25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "building.columns")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.gray)
            
            Text("Art Institute")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            Text("Browse artworks from the Art Institute of Chicago using a modern SwiftUI interface.")
            Divider()
            
            
            VStack(alignment: .leading, spacing: 15){
                Label("SwiftUI", systemImage: "swift")
                Label("REST API", systemImage: "network")
                Label("MVVM Architecture", systemImage: "square.stack.3d.up")
                Label("JSON Decoding", systemImage: "curlybraces")
            } // Vstack ends
            
            Spacer()
            Divider()

            Text("Developed by")
                .font(.headline)
            Text("Syed Fahad Rasheed")
                .foregroundStyle(.secondary)


        } // Vstack ends
    }
}

#Preview {
    AboutView()
}
