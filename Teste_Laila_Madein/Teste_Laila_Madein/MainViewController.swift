//
//  ViewController.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 13/08/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchTextFiel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextFiel.delegate = self
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
    }
    
}


// MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
}
