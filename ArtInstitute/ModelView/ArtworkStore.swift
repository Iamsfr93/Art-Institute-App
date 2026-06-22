//
//  ArtworkStore.swift
//  ArtInstitute
//
//  Created by Syed Fahad Rasheed on 2026-06-18.
//

import Foundation
import Combine

//allow SwiftUI views to automatically react to data changes
class ArtworkStore: ObservableObject {
    //Published Properties
    @Published var artworks : [Artwork] = []
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var showError = false
    
    private let services = ArtAPIService()
    //Initializer
    init (){
        fetchArtworks()
        
    }
    
    func fetchArtworks(){
        isLoading = true
        
        services.fetchArtworks{ artworks in
            self.artworks = artworks
            
            self.isLoading = false
            //error message when empty 
            if artworks.isEmpty {
                self.errorMessage = "unable to load artworks"
                self.showError = true
                
            }
            
        }
    }
}



