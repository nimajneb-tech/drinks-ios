//
//  ApiError.swift
//  drinks
//
//  Created by Benjamin on 24/06/2021.
//

import Foundation

class ApiError: Error, Decodable, LocalizedError {
    var code: Int
    var message: String
    
    public var errorDescription: String? {
        return self.message
    }

    enum CodingKeys: String, CodingKey {
        case error = "error"
        case code = "code"
        case message = "message"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let error = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .error)
        self.code = try error.decode(Int.self, forKey: .code)
        self.message = try error.decode(String.self, forKey: .message)
    }
}

