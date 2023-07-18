//
//  URLConstants.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//
import Foundation

enum URLConstants: String {
    case searchBaseURL = "https://api.themoviedb.org/3/search/movie?query="
    case detailBaseURL = "https://api.themoviedb.org/3/movie/"
    case baseURLImage = "https://image.tmdb.org/t/p/w500"
    case questionMark = "?"
    case apiKeyWord = "api_key="
    case slashMark = "/"
    case andMark = "&"
    case apiKey = "9586add06529569988090a1a3c62a733"
    
}

enum URLTypes{
    case search(query: String)
    case details (idKey: String)
    
    var endPoints: String {
        switch self{
        case .search(let query):
//            https://api.themoviedb.org/3/search/movie?query=Lord+Of&api_key=9586add06529569988090a1a3c62a733
            return URLConstants.searchBaseURL.rawValue + query + URLConstants.andMark.rawValue + URLConstants.apiKeyWord.rawValue + URLConstants.apiKey.rawValue
        case .details(let idKey):
//            https://api.themoviedb.org/3/movie/343611?api_key=9586add06529569988090a1a3c62a733
            return URLConstants.detailBaseURL.rawValue + idKey + URLConstants.questionMark.rawValue + URLConstants.apiKeyWord.rawValue + URLConstants.apiKey.rawValue
        }
    }
}

