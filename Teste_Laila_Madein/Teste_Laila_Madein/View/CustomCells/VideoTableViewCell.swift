//
//  VideoTableViewCell.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 13/08/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static var cache = [String : Data]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    func setup(value: Item) {
        
        titleLabel.text = value.snippet.title
        descriptionLabel.text = value.snippet.snippetDescription
        
        guard value.snippet.thumbnails.thumbnailsDefault.url != "" else {
            return
        }
        
        if let cachedData = VideoTableViewCell.getVideoCache(value.snippet.thumbnails.thumbnailsDefault.url) {
                    self.thumbnailImageView.image = UIImage(data: cachedData)
                    return
                }
        
        let url = URL(string: value.snippet.thumbnails.thumbnailsDefault.url)
        
        let sesseion = URLSession.shared
        
        let dataTask = sesseion.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                VideoTableViewCell.setVideoCache(url!.absoluteString, data)
                if url!.absoluteString != value.snippet.thumbnails.thumbnailsDefault.url {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        dataTask.resume()
        
        
        
        
        
//
//        if let cachedData = VideoTableViewCell.getVideoCache(value.snippet.thumbnails.thumbnailsDefault.url) {
//            self.thumbnailImageView.image = UIImage(data: cachedData)
//            return
//        }
        //thumbnailImageView.image = UIImage(named: value.snippet.thumbnails.thumbnailsDefault.url)
    }
}
