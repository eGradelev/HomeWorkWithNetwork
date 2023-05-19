//
//  CharacterDetailsViewController.swift
//  HomeWorkWithNetwork
//
//  Created by Gradelev Elisey on 17.05.2023.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var characterImage: UIImageView! {
        didSet {
          //  characterImage.layer.cornerRadius = characterImage.frame.height / 2
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Public properties
    var character: Character!
    
    //MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        title = character.name
        descriptionLabel.text = character.description
        fetchImage()
    }
    
    //MARK: - Private Methods
    private func fetchImage() {
        networkManager.fetchImage(from: character.imageUrl) { result in
            switch result {
            case .success(let imageData):
                self.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
