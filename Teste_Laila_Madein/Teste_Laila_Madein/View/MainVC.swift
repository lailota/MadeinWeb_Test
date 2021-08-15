//
//  ViewController.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 13/08/21.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    private var controller: MainController = MainController()
    private var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchTextField.delegate = self
        self.alert = Alert(viewController: self)
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        alert?.indicatorAlert()
        
        self.dismiss(animated: true) {
            self.performSegue(withIdentifier: "goToSearchVC", sender: self)
            self.searchTextField.text = nil
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SearchVC {
            destinationVC.controller = controller
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.searchButton.isEnabled = false
        self.searchButton.alpha = 0.5
        self.navigationController?.navigationBar.isHidden = true
        self.controller.clearArray()
    }
    
}


// MARK: - UITextFieldDelegate

extension MainVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if searchTextField.resignFirstResponder() {
            self.controller.loadVideos(text: self.searchTextField.text ?? "")
            self.searchButton.isEnabled = true
            self.searchButton.alpha = 1.0
        }
        return true
    }
    
}


