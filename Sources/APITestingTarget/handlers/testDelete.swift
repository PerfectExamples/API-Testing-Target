//
//  testDelete.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-04-10.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//

import PerfectHTTP

extension Handlers {
	/// Testing DELETE
	static func testDelete(data: [String:Any]) throws -> RequestHandler {
		return {
			request, response in
			// Generic dict
			var out = [String: Any]()

			// Testing for the url var {id}
			if let id = request.urlVariables["id"], !id.isEmpty {
				// Filter it out
				let newArray = userArray.filter{ $0.id != id }
				// Test if the filter caught anything or not
				if newArray.count == userArray.count {
					out["error"] = "not found"
				} else {
					out["error"] = "none"
				}
				// userArray is now the new array
				userArray = newArray
			}

			let _ = try? response.setBody(json: out)
			response.completed()
		}
	}
}
