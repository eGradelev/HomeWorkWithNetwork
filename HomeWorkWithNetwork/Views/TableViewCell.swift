//
//  TableViewCell.swift
//  HomeWorkWithNetwork
//
//  Created by Gradelev Elisey on 18.05.2023.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var characterImage: UIImageView! {
        didSet {
            characterImage.contentMode = .scaleAspectFit
            characterImage.clipsToBounds = true
            characterImage.layer.cornerRadius = characterImage.frame.height / 2
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    //MARK: - Public methpds
    func configure(with character: Character?) {
        guard let character else { return }
        nameLabel.text = character.name
        networkManager.fetchImage(from: character.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
