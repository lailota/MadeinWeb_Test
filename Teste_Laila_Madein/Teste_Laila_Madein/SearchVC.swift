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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationItem()
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        videoTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
        videoTableView.tableFooterView = UIView()
        navigationController?.navigationBar.isHidden = false
        print(controller.count, "lailota")

    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
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
    
    
}
