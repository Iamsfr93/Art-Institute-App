//
//  ArtAPIService.swift
//  ArtInstitute
//
//  Created by Syed Fahad Rasheed on 2026-06-18.
//



import Foundation

class ArtAPIService {
    // network request and returns decoded artwork

    func fetchArtworks(completion: @escaping ([Artwork]) -> Void) {

        let urlString = "https://api.artic.edu/api/v1/artworks?page=1&limit=20"
        
        
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else {
                print("there is no data recieved")
                completion([])
                return
            }

            do {
               // Decodes JSON data received 
                let result = try JSONDecoder().decode(
                    ArtworkResponse.self,
                    from: data
                )

                DispatchQueue.main.async {
                    completion(result.data)
                }

            } catch {
                print("DECODE FAILED")
                print(error)
                DispatchQueue.main.async {
                completion([])
                    }
            }

        }.resume()
    }
}
