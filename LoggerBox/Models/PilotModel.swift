//
//  PilotModel.swift
//  LoggerBox
//
//  Created by David Petzold on 12/4/24.
//

import CloudKit
import Foundation

struct Pilot: Identifiable, Codable {
    var id = UUID()
    let first_name: String
    let last_name: String
    let roles: PilotRoles

    // Custom initializer to decode from CKRecord
    init(from record: CKRecord) throws {
        guard let firstName = record["first_name"] as? String,
            let lastName = record["last_name"] as? String,
            let roleString = record["roles"] as? String,
            let role = PilotRoles(rawValue: roleString)
        else {
            throw NSError(
                domain: "PilotModel", code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey:
                        "Missing or invalid data in CKRecord"
                ])
        }

        self.id = UUID()
        self.first_name = firstName
        self.last_name = lastName
        self.roles = role
    }

    // Default initializer for creating Pilot objects
    init(
        first_name: String = "Default First Name",
        last_name: String = "Default Last Name",
        roles: PilotRoles = .pilot
    ) {
        self.id = UUID()
        self.first_name = first_name
        self.last_name = last_name
        self.roles = roles
    }
}

enum PilotRoles: String, Codable {
    case logger = "Logger"
    case chainsaw = "Chainsaw"
    case pilot = "Pilot"

    // Default role is pilot
    static var defaultRole: PilotRoles {
        return .pilot
    }
}
