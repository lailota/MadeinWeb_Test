//
//  View+Extension.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 14/08/21.
//

import Foundation
import UIKit

extension UIViewController {
    func setNavigationItem() {
        let imageView = UIImageView(image: UIImage(named: "madeinweb"))
        self.navigationItem.titleView = imageView
        self.navigationItem.titleView?.contentMode = .scaleAspectFit
        
    }
    
}
