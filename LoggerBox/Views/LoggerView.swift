//
//  LoggerView.swift
//  LoggerBox
//
//  Created by David Petzold on 12/3/24.
//

import SwiftUI

struct LoggerView: View {
    @State var flights: [Flight] = [Flight.init(), Flight.init()]

    var body: some View {
        List(flights) { flight in
            FlightCardView(flight: flight)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity)  // Center the content
                .padding()
        }
        .listStyle(.plain)  // Use plain list style
        .background(Color(.systemBackground))  // Set background to the system's default background color
    }
}

#Preview {
    LoggerView()
}
