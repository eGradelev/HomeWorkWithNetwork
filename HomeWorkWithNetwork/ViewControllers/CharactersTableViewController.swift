//
//  ViewController.swift
//  HomeWorkWithNetwork
//
//  Created by Gradelev Elisey on 14.05.2023.
//

import UIKit

final class CharactersTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private let networkManager = NetworkManager.shared
    private var disneyCharacters: DisneyCharacters?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDisneyCharacters()
    }
    
//MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        disneyCharacters?.data.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        return cell
    }
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
    }
    
}
// MARK: - Networking
extension CharactersTableViewController {
    private func fetchDisneyCharacters () {
        networkManager.fetch(DisneyCharacters.self, from: DisneyApi.baseURL.url) { result in
            switch result {
            case .success(let characters):
                print(characters)
            case .failure(let error):
                print(error)
            }
        }
    }
}
