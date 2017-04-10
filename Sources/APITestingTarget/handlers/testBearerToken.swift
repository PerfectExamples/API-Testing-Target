//
//  testBearerToken.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTP
import SwiftString

extension Handlers {
    /// Testing GET testing Bearer Token
    static func testBearerToken(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in
			// Demonstrates the use of header info like Bearer tokens
			if let bearer = request.header(.authorization), !bearer.isEmpty {
				// From Bearer Token
				let b = bearer.chompLeft("Bearer ")
				let _ = try? response.setBody(json: ["token": "\(b)"])
			} else {
				let _ = try? response.setBody(json: ["error": "No bearer token supplied"])
			}
            response.completed()
        }
    }
}
