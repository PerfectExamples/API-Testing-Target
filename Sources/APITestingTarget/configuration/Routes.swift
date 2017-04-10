//
//  Routes.swift
//  APITestingTarget
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTPServer

func mainRoutes() -> [[String: Any]] {
    var routes: [[String: Any]] = [[String: Any]]()
    routes.append(["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles, "documentRoot":"./webroot","allowResponseFilters":true])

    /// Special healthcheck route
    routes.append(["method":"get", "uri":"/healthcheck", "handler":Handlers.healthcheck])

    /// Testing GET
    routes.append(["method":"get", "uri":"/api/v1/test", "handler":Handlers.testGet])

    /// Testing GET by ID
    routes.append(["method":"get", "uri":"/api/v1/test/{id}", "handler":Handlers.testGet])

    /// Testing POST
    routes.append(["method":"post", "uri":"/api/v1/test", "handler":Handlers.testPost])

    /// Testing PATCH
    routes.append(["method":"patch", "uri":"/api/v1/test/{id}", "handler":Handlers.testPatch])

    /// Testing DELETE
    routes.append(["method":"delete", "uri":"/api/v1/test/{id}", "handler":Handlers.testDelete])

    /// Testing GET enforcing Bearer Token
    routes.append(["method":"get", "uri":"/api/v1/testbearer", "handler":Handlers.testBearerToken])

    /// Testing HTML
    routes.append(["method":"get", "uri":"/", "handler":Handlers.stdHTML])

    return routes
}
