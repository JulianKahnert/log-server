//
//  EventService.swift
//  App
//
//  Created by Julian Kahnert on 21.07.19.
//

import Foundation

class EventService {

    static let shared = EventService()

    private var events = [Event]()

    private init() { }

    func handle(new event: Event) {

        if events.count > 1000 {
            events = Array(events.prefix(10))
        }

        events.append(event)
    }

    func getStats() -> String {

        let infoEventCount = events.filter({ $0.type == .info }).count
        let warnEventCount = events.filter({ $0.type == .warn }).count

        return """
        Event Counts:
        Info: \(infoEventCount)
        Warn: \(warnEventCount)
        """
    }
}
