//
//  FlightCardView.swift
//  LoggerBox
//
//  Created by David Petzold on 12/4/24.
//

import SwiftUI

struct FlightCardView: View {
    @State var flight: Flight

    var acceptedFlight: Bool = false

    var body: some View {
        VStack {
            // Flight Details
            HStack {
                Text(flight.tail_number)
                    .frame(width: 100, height: 100, alignment: .leading)

                // Data
                VStack {
                    HStack {
                        Text(flight.pilot_1.last_name)
                        Text(flight.pilot_2.last_name)
                    }
                    .padding()

                    HStack {
                        Text("\(flight.orm)")
                        Text("\(flight.cg)")
                        Text(flight.mission)
                    }
                }
            }
            .padding()

            // Accept / Deny
            HStack {
                Button("Deny", role: .destructive) {
                    print("Deny")
                }
                .buttonStyle(.borderedProminent)

                Button("Approve") {
                    print("Approve")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .frame(width: 300, height: 200)
        .border(Color.black)
    }
}

#Preview {
    FlightCardView(flight: Flight.init())
}
