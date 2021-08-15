//
//  MainController.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 13/08/21.
//

import Foundation

protocol MainControllerProtocol: AnyObject {
    
    func success()
    func failed(error: Error)
    
}

class MainController {
    
    private (set) var videoArray:[Item] = []
    private weak var delegate: MainControllerProtocol?
    var detailVideo: Item2?
    
    
    var count: Int {
        return self.videoArray.count
    }
    
    func setupDelegate(delegate: MainControllerProtocol?) {
        self.delegate = delegate
    }
    
    func loadCurrentVideo(indexPath: IndexPath) -> Item {
        return self.videoArray[indexPath.row]
    }
    
    
    func clearArray() {
        self.videoArray.removeAll()
    }
    
    // MARK: - Load Video
    
    func loadVideos(text: String) {
        let url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=id,snippet&q=\(text)&key=\(ApiValue.get().key)")
        
        guard url != nil else {
            return
        }
            
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URlSession object
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Welcome.self, from: data!)
                
                for _response in response.items {
                    let newData = Item(kind: _response.kind, etag: _response.etag, id: _response.id, snippet: _response.snippet)
                    
                    DispatchQueue.main.async {
                        self.videoArray.append(newData)
                        print(self.videoArray.count)
                    }
                }
                DispatchQueue.main.async {
                    self.delegate?.success()
                }
            }
            catch {
                self.delegate?.failed(error: error)
            }
            
        }
        // Kick off the task
        task.resume()
    }
    
    
    // MARK: - Load Detail Video
    
    func detailVideo(url: String) {
        let url = URL(string: url)
        
        guard url != nil else {
            return
        }
            
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URlSession object
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Welcome2.self, from: data!)
                
                for _response in response.items! {
                    let newData = Item2(kind: _response.kind, etag: _response.etag, id: _response.id, snippet: _response.snippet, statistics: _response.statistics)
                    
                    DispatchQueue.main.async {
                        self.detailVideo = newData
                    }
                }
                DispatchQueue.main.async {
                    self.delegate?.success()
                }
                
            }
            catch {
                self.delegate?.failed(error: error)
            }
            
        }
        // Kick off the task
        task.resume()
    }
}


