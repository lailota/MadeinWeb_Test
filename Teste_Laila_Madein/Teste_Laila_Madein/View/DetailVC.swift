//
//  DetailVC.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 14/08/21.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var detailVideo: Item2?
    var controller: MainController = MainController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationItem()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.videoTitleLabel.text = self.controller.detailVideo?.snippet?.title
            self.viewsLabel.text = "\(self.controller.detailVideo?.statistics?.viewCount ?? "") visualizações"
            self.descriptionTextView.text = self.controller.detailVideo?.snippet?.snippetDescription
            
            guard self.controller.detailVideo?.snippet?.thumbnails?.thumbnailsDefault?.url != "" else {
                return
            }

            if let cachedData = CacheManager.getVideoCache((self.controller.detailVideo?.snippet?.thumbnails?.thumbnailsDefault?.url) ?? "") {
                self.imageView.image = UIImage(data: cachedData)
                return
            }
            
            if let url = URL(string: (self.controller.detailVideo?.snippet?.thumbnails?.thumbnailsDefault?.url) ?? "") {
                let sesseion = URLSession.shared
                
                let dataTask = sesseion.dataTask(with: url) { (data, response, error) in
                    
                    if error == nil && data != nil {
                        
                        CacheManager.setVideoCache(url.absoluteString, data)
                        if url.absoluteString != self.controller.detailVideo?.snippet?.thumbnails?.thumbnailsDefault?.url {
                            return
                        }
                        
                        let image = UIImage(data: data!)
                        
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
                dataTask.resume()
            }
            
        }
    }
    
}
