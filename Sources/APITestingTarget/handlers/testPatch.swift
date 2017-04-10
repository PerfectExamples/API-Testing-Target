//
//  testPut.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTP

extension Handlers {
    /// Testing PATCH (modify)
    static func testPatch(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in
			// Generic output dict
			var out = [String: Any]()

			// Test and Set the supplied {id}
			if let id = request.urlVariables["id"], !id.isEmpty {
				var foundid = ""

				// Look through the array
				for u in userArray {
					if u.id == id {
						// found a match
						foundid = id
						// now we chck the body for the JSON
						if let body = request.postBodyString, !body.isEmpty {
							do {
								// decode the body to json
								let json = try body.jsonDecode() as? [String:Any]
								// looking for "name"
								if let name = json?["name"], !((name as? String ?? "").isEmpty) {
									// Set the name to the new name 
									u.name = name as? String ?? ""
									out["error"] = "none"
								}
							} catch {
								print(error)
								out["error"] = "\(error)"
							}
						}

					}
				}
				if foundid.isEmpty {
					out["error"] = "please supply a valid id"
				}

			} else {
				out["error"] = "please supply a valid id"
			}

			let _ = try? response.setBody(json: out)
            response.completed()
        }
    }
}
