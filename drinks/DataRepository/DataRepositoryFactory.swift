//
//  DataRepositoryFactory.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation

/// Repository factory
///
/// Creates a repository with either staging or production configuration
class DataRepositoryFactory {
    
    /// Returns the production repository
    private lazy var production: DataRepository = {
        return DataRepository(baseUrl: "https://the-cocktail-db.p.rapidapi.com/popular.php", apiKey: "84c0f542admsh7703805c5e1ce9ep107f48jsnaf7a8cf91575")
    }()
    
    /// Returns the production repository
    private lazy var staging: DataRepository = {
        return DataRepository(baseUrl: "https://the-cocktail-db.p.rapidapi.com/popular.php", apiKey: "84c0f542admsh7703805c5e1ce9ep107f48jsnaf7a8cf91575")
    }()
    
    //// Returns the localhost repository
    private lazy var localhost: DataRepository = {
        return DataRepository(baseUrl: "https://the-cocktail-db.p.rapidapi.com/popular.php", apiKey: "84c0f542admsh7703805c5e1ce9ep107f48jsnaf7a8cf91575")
    }()
    
    /// Returns repository depending on build type
    func repository() -> DataRepository {
        #if DEBUG
        #if targetEnvironment(simulator)
        return self.localhost
        #else
        return self.staging
        #endif
        #else
        return self.production
        #endif
    }
}
