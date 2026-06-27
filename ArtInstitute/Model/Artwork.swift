//
//  Artwork.swift
//  ArtInstitute
//
//  Created by Syed Fahad Rasheed on 2026-06-18.
//

import Foundation

struct Artwork: Identifiable, Codable{
    /// The unique identifier
    let id: Int
    let title: String
    let image_id: String?
    let artist_title: String?
    let thumbnail: Thumbnail?
}
