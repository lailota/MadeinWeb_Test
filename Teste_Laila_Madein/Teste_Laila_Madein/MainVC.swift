//
//  ViewController.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 13/08/21.
//

import UIKit

class MainVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    private var controller: MainController = MainController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchTextField.delegate = self
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        indicatorAlert()
        
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
    }
    
    
    func indicatorAlert() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true) {
            sleep(2)
        }
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



    
    //    @objc func backButton() {
    //        let view = UIView()
    //            let button = UIButton(type: .system)
    //            button.setImage(UIImage(named: "voltar"), for: .normal)
    //            button.setTitle("voltar", for: .normal)
    //            button.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    //            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
    //            button.sizeToFit()
    //            view.addSubview(button)
    //            view.frame = button.bounds
    //            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
    //    }
    //        let button = UIImage(named: "voltar")
    //
    //       // self.navigationItem.backBarButtonItem?.image = button
    //        self.navigationController?.navigationBar.backIndicatorImage = button
    //        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = button
    // self.navigationController?.navigationBar.backItem?.title = "voltar"
    //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "voltar", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    // self.navigationItem.backButtonTitle = "voltar"
    //   }



