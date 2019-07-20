//
//  LogController.swift
//  App
//
//  Created by Julian Kahnert on 21.07.19.
//

import Vapor

final class LogController {

    func event(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.content.decode(Event.self).map(to: HTTPStatus.self) { event in

            // handle the incoming event
            EventService.shared.handle(new: event)

            return .ok
        }
    }

    func stats(_ req: Request) throws -> String {

        let stats = EventService.shared.getStats()

        return """
        Here are the stats from \(Date().description)

        \(stats)
        """
    }
}
