//
//  Test.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import Foundation

/// For Testing
class Test {

    // Properties
    /// Row ID
    public var id = ""

    /// Name
    public var name = ""

	init(_ nameof: String) {
		id = UUID().uuidString
		name = nameof
	}
	func asDict() -> [String: Any]{
		return ["id":id, "name": name]
	}

}
