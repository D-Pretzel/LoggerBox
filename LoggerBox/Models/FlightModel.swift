//
//  FlightModel.swift
//  LoggerBox
//
//  Created by David Petzold on 12/4/24.
//

import CloudKit
import Foundation

struct Flight: Identifiable {
    var id = UUID()
    let pilot_1: Pilot
    let pilot_2: Pilot
    let cg: Int
    let tail_number: String
    let mission: String
    let orm: Int
    let takeoff_time: Date
    let landing_time: Date

    // Convert to CloudKit record
    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: "Flight")
        record["pilot_1_first_name"] = pilot_1.first_name as CKRecordValue
        record["pilot_1_last_name"] = pilot_1.last_name as CKRecordValue
        record["pilot_1_roles"] = pilot_1.roles.rawValue as CKRecordValue
        record["pilot_2_first_name"] = pilot_2.first_name as CKRecordValue
        record["pilot_2_last_name"] = pilot_2.last_name as CKRecordValue
        record["pilot_2_roles"] = pilot_2.roles.rawValue as CKRecordValue
        record["cg"] = cg as CKRecordValue
        record["tail_number"] = tail_number as CKRecordValue
        record["mission"] = mission as CKRecordValue
        record["orm"] = orm as CKRecordValue
        record["takeoff_time"] = takeoff_time as CKRecordValue
        record["landing_time"] = landing_time as CKRecordValue
        return record
    }

    // Custom initializer to decode from CKRecord
    init(from record: CKRecord) throws {
        guard let pilot1FirstName = record["pilot_1_first_name"] as? String,
            let pilot1LastName = record["pilot_1_last_name"] as? String,
            let pilot1RoleString = record["pilot_1_roles"] as? String,
            let pilot1Role = PilotRoles(rawValue: pilot1RoleString),
            let pilot2FirstName = record["pilot_2_first_name"] as? String,
            let pilot2LastName = record["pilot_2_last_name"] as? String,
            let pilot2RoleString = record["pilot_2_roles"] as? String,
            let pilot2Role = PilotRoles(rawValue: pilot2RoleString),
            let cg = record["cg"] as? Int,
            let tailNumber = record["tail_number"] as? String,
            let mission = record["mission"] as? String,
            let orm = record["orm"] as? Int,
            let takeoffTime = record["takeoff_time"] as? Date,
            let landingTime = record["landing_time"] as? Date
        else {
            throw NSError(
                domain: "FlightModel", code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey:
                        "CKRecord did a fuckey wuckey"
                ])
        }

        self.id = UUID()
        self.pilot_1 = Pilot(
            first_name: pilot1FirstName, last_name: pilot1LastName,
            roles: pilot1Role)
        self.pilot_2 = Pilot(
            first_name: pilot2FirstName, last_name: pilot2LastName,
            roles: pilot2Role)
        self.cg = cg
        self.tail_number = tailNumber
        self.mission = mission
        self.orm = orm
        self.takeoff_time = takeoffTime
        self.landing_time = landingTime
    }

    // Default initializer
    init(
        pilot_1: Pilot = Pilot(
            first_name: "Default", last_name: "Pilot 1", roles: .pilot),
        pilot_2: Pilot = Pilot(
            first_name: "Default", last_name: "Pilot 2", roles: .pilot),
        cg: Int = 58,
        tail_number: String = "2AT",
        mission: String = "Test Mission",
        orm: Int = 5,
        takeoff_time: Date = Date(),
        landing_time: Date = Date().addingTimeInterval(3600)
    ) {
        self.id = UUID()
        self.pilot_1 = pilot_1
        self.pilot_2 = pilot_2
        self.cg = cg
        self.tail_number = tail_number
        self.mission = mission
        self.orm = orm
        self.takeoff_time = takeoff_time
        self.landing_time = landing_time
    }
}
