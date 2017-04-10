# API Testing Target

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

## API Testing Target Project

This repository is intended as a demonstration project for testing API's with Postman or Paw.

It provides a small range of API endpoints illustrating specific techniques.

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/002e19819d06eff094f3)

## Compatibility with Swift

The master branch of this project currently compiles with **Xcode 8.3** or the **Swift 3.1** toolchain on Ubuntu.

## Building & Running

The following will clone and build an empty starter project and launch the server on port 8181.

```
git clone https://github.com/PerfectExamples/API-Testing-Target.git
cd API-Testing-Target
swift build
.build/debug/APITestingTarget
```

You should see the following output:

```
[INFO] Starting HTTP server localhost on 0.0.0.0:8181
```

This means the server is running and waiting for connections. Access [http://localhost:8181/](http://localhost:8181/) to see the greeting. Hit control-c to terminate the server.

## Starter Content

### List content:

``` swift
routes.append(["method":"get", "uri":"/api/v1/test", "handler":Handlers.testGet])
```

Returns an array of users. Note the `id` is randomly generated at each executable launch.

``` json
{
  "result": [
    {
      "id": "0ED87700-16BA-4210-A8F7-5496EADAD224",
      "name": "Peter"
    },
    {
      "id": "6463DD8A-A3B9-4692-BE85-E0FC679396C0",
      "name": "Kirsty"
    },
    {
      "id": "06A3ADD7-470F-4818-891A-CE5BB120C63E",
      "name": "James"
    },
    {
      "id": "F71A0304-C1C8-45A3-8819-1CB81580A1DE",
      "name": "Anna"
    },
    {
      "id": "5344ACBC-07DD-430B-8D5C-1AFFBD2DA7B4",
      "name": "Sarah"
    }
  ]
}
```

### Retrieve a specific entry

``` swift
routes.append(["method":"get", "uri":"/api/v1/test/{id}", "handler":Handlers.testGet])
```

Returns JSON wil the details of the matching entry

``` json
{
  "result": {
    "id": "6463DD8A-A3B9-4692-BE85-E0FC679396C0",
    "name": "Kirsty"
  }
}
```

### Submits a new record to be added to the array


``` swift
routes.append(["method":"post", "uri":"/api/v1/test", "handler":Handlers.testPost])
```

Submitting with a payload of `{"name":"David"}` will return `{ "error": "none" }`

## Modify a record

``` swift
routes.append(["method":"patch", "uri":"/api/v1/test/{id}", "handler":Handlers.testPatch])
```

Submit with a raw content body of `{"name":"P3t3r"}` and a matching `{id}` in the body to trigger an update.

### Deletes a specific entry

``` swift
routes.append(["method":"delete", "uri":"/api/v1/test/{id}", "handler":Handlers.testDelete])
```

### Demonstrates the extraction of a header value from the request

``` swift
routes.append(["method":"get", "uri":"/api/v1/testbearer", "handler":Handlers.testBearerToken])
```

In Postman (or equivalent), add a "Authorization" header parameter with a value of "Bearer {token}", where `{token}` is your bearer token value. The method in the API will extract the token and echo it back to you.

Bearer tokens are extensively used for JSON API authorizations.

### Simple HTML

``` swift
routes.append(["method":"get", "uri":"/", "handler":Handlers.stdHTML])
```

This API also contains some simple HTML to demonstrate previewing the raw source and rendered code within Postman or equivalent.


## Issues

We use JIRA for all bugs and support related issues.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)



## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
