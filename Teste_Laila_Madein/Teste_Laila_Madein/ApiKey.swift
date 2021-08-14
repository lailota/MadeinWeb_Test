//
//  ApiKey.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 14/08/21.
//

import Foundation

struct Secret: Decodable {
    let key : String
}


struct ApiValue {
    static func get() -> Secret {
        guard let url = Bundle.main.url(forResource: "apiKey", withExtension: "plist") else {
            fatalError("Could't find file 'apiKey.plist'in your Bundle.")
        }
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            return try decoder.decode(Secret.self, from: data)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
}
