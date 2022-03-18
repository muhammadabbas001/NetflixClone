//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Muhammad Abbas on 14/03/2022.
//

import Foundation

struct Constants{
    static let API_KEY = "8c108c51f9b5cd0d037fccb2a61cbe74"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyCbNj4p-LjoOAPMBpfcTv5OIbLoTYBAJb0"
    static let YoutubeBaseUrl = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error{
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>)->()){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>)->()){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>)->()){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>)->()){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>)->()){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>)->()){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>)->()){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>)->()){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.YoutubeBaseUrl)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items.first!))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
}
