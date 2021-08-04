//
//  CacheManager.swift
//  drinks
//
//  Created by Benjamin on 04/08/2021.
//

import Foundation

struct CacheKeys {
    static let user: String = "user"
    static let drinkId: String = "drinkIds"
}

class CacheManager {
    
    static let shared = CacheManager()
    private var _user: User?

    var user: User {
        get {
            guard let _value = _user else {
                
                let decoded  = UserDefaults.standard.data(forKey: CacheKeys.user)
                guard let _decoded = decoded else {
                    _user = User()
                    return _user ?? User()
                }
                
                _user = (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(_decoded) as? User)
                return _user ?? User()
            }
            return _value
        }
        
        set {
            
            _user = newValue
            let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: _user as Any, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: CacheKeys.user)
            UserDefaults.standard.synchronize()
        }
    }
}
