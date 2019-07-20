//
//  routes.swift
//  App
//
//  Created by Julian Kahnert on 21.07.19.
//


import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    router.get { req in


        return """
        ██╗  ██╗███████╗██╗     ██╗      ██████╗      █████╗  ██████╗ ██╗███╗   ██╗
        ██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ██╔══██╗██╔════╝ ██║████╗  ██║
        ███████║█████╗  ██║     ██║     ██║   ██║    ███████║██║  ███╗██║██╔██╗ ██║
        ██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ██╔══██║██║   ██║██║██║╚██╗██║
        ██║  ██║███████╗███████╗███████╗╚██████╔╝    ██║  ██║╚██████╔╝██║██║ ╚████║
        ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝


    Thank you for stopping by. Please use one of the following endpoints:

    * GET /stats
    * POST /event

    Examples:
    curl -d '{"type":"info", "message":"this is a test"}' -H "Content-Type: application/json" -X POST http://localhost:8080/event

    """
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // log processing
    let logHandler = LogController()
    router.post("event", use: logHandler.event)
    router.get("stats", use: logHandler.stats)
}
