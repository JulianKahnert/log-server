//
//  Event.swift
//  App
//
//  Created by Julian Kahnert on 20.07.19.
//

import Foundation
import Vapor

struct Event: Content {
    let type: LogType
    let message: String
}

extension Event {
    enum LogType: String, Codable {
        case info
        case warn
    }
}
