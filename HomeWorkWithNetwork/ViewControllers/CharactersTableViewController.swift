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
    private var chosenCharacter: [Character] = []
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
        fetchData(from: DisneyApi.baseURL.url)
    }
    

    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let character = chosenCharacter[indexPath.row]
        guard let detailVC = segue.destination as? CharacterDetailsViewController else { return }
        detailVC.character = character
    }
    //MARK: - IB Actions
    
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1
        ? fetchData(from: disneyCharacters?.info.nextPage)
        : fetchData(from: disneyCharacters?.info.previousPage)
    }
    
}
// MARK: - Networking
extension CharactersTableViewController {
    private func fetchData(from url: URL?) {
        networkManager.fetch(DisneyCharacters.self, from: url) { [weak self] result in
            switch result {
            case .success(let disneyCharacters):
                print(disneyCharacters)
                self?.disneyCharacters = disneyCharacters
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}


//MARK: - UITableViewDataSource
extension CharactersTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        disneyCharacters?.data.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        guard let cell = cell as? TableViewCell else { return UITableViewCell() }
        let character = disneyCharacters?.data[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}
