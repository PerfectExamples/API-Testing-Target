//
//  testPost.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTP

extension Handlers {
    /// Testing POST (Create)
    static func testPost(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in
			// Generic output dict
			var out = [String: Any]()

			// Looking for the JSON body
			if let body = request.postBodyString, !body.isEmpty {
				do {
					// test the JSON decode
					let json = try body.jsonDecode() as? [String:Any]
					// look for the name param
					if let name = json?["name"], !((name as? String ?? "").isEmpty) {
						// make a new object with the new name
						let n = Test(name as? String ?? "")
						// Add it to the array
						userArray.append(n)
						out["error"] = "none"
					}
				} catch {
					print(error)
					out["error"] = "\(error)"
				}
			}


			let _ = try? response.setBody(json: out)
            response.completed()
        }
    }
}
