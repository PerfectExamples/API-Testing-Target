//
//  stdHTML.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTP
import PerfectMustache

extension Handlers {
    /// Testing HTML
    static func stdHTML(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in
			// A sample simple HTML output from Mustache
            let context: [String : Any] = [
                "property": "value"
            ]
            response.render(template: "templates/stdHTML", context: context)
            response.completed()
        }
    }
}
