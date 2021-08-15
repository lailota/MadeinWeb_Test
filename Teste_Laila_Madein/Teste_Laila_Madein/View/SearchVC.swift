//
//  SearchViewController.swift
//  Teste_Laila_Madein
//
//  Created by Laila Guzzon Hussein Lailota on 13/08/21.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var controller: MainController = MainController()
    var videos = [Item]()
    private var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        self.setNavigationItem()
        self.controller.setupDelegate(delegate: self)
        self.alert = Alert(viewController: self)
        
        videoTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
        videoTableView.tableFooterView = UIView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.searchButton.isEnabled = false
        self.searchButton.alpha = 0.5
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        alert?.indicatorAlert()
       
        self.dismiss(animated: true) {
            self.searchTextField.text = nil
            self.videoTableView.reloadData()
            self.searchButton.isEnabled = false
            self.searchButton.alpha = 0.5
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard videoTableView.indexPathForSelectedRow != nil else {
            return
        }

        let destinationVC = segue.destination as? DetailVC
        destinationVC?.controller = controller
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: VideoTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as? VideoTableViewCell
        cell?.setup(value: controller.loadCurrentVideo(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let selectedVideo = self.controller.videoArray[self.videoTableView.indexPathForSelectedRow!.row].id.videoID
            let urlString = "https://www.googleapis.com/youtube/v3/videos?id=\(selectedVideo)&part=snippet,statistics&key=\(ApiValue.get().key)"
            self.controller.detailVideo(url: urlString)
            self.performSegue(withIdentifier: "goToDetailVC", sender: self)
            
        }
    }
    
}


// MARK: - UITextFieldDelegate

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchTextField.resignFirstResponder() {
            self.controller.loadVideos(text: self.searchTextField.text ?? "")
            self.searchButton.isEnabled = true
            self.searchButton.alpha = 1.0
            self.controller.clearArray()
        }
        return true
    }
}


extension SearchVC: MainControllerProtocol {
    func success() {
        
    }
    
    func failed(error: Error) {
        print(error)
    }
}
