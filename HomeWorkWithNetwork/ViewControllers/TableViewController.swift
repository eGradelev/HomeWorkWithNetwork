//
//  ViewController.swift
//  HomeWorkWithNetwork
//
//  Created by Gradelev Elisey on 14.05.2023.
//

import UIKit
enum DisneyApi {
    case baseURL
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://api.disneyapi.dev/character")!
        }
    }
}

final class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      fetchAnimeFacts()
    }


}
extension TableViewController {
    private func fetchAnimeFacts () {
        URLSession.shared.dataTask(with: DisneyApi.baseURL.url) {data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder ()
                let animeFacts = try decoder.decode(DisneyCharacters.self, from: data)
                print(animeFacts)
            } catch {
                print(error)
            }
        }.resume()
    }
}

