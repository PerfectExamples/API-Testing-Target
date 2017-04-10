//
//  testGet.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTP

extension Handlers {
    /// Testing GET by ID
    static func testGet(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in
			// Generic output array
			var out = [String: Any]()
			// Testing to see if the {id} var is in the URL
			if let id = request.urlVariables["id"], !id.isEmpty {
				// Searching for the match
				let result = userArray.filter{ $0.id == id }
				if result.count == 0 {
					out["error"] = "not found"
				} else if result.count > 1 {
					out["error"] = "ambiguous match"
				} else {
					// output the result as a dict so it can be converted to json
					out["result"] = result[0].asDict()
				}
			} else {
				// list view, no url id was sent
				var r = [[String:Any]]()
				// make an array of dicts
				for u in userArray { r.append(u.asDict()) }
				out["result"] = r
			}

			let _ = try? response.setBody(json: out)
            response.completed()
        }
    }
}
