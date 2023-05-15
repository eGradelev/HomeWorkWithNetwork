//
//  AnimeFacts.swift
//  HomeWorkWithNetwork
//
//  Created by Gradelev Elisey on 14.05.2023.
//

import Foundation

struct DisneyCharacters: Decodable {
    let info: Info
    let data: [Character]
}
struct Info: Decodable {
    let totalPages: Int
    let previousPage: URL?
    let nextPage: URL?
}
struct Character: Decodable {
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    let parkAttractions: [String]
    let allies: [String]
    let enemies: [String]
    let sourceUrl: URL
    let name: String
    let imageUrl: URL
    let url: URL
}
