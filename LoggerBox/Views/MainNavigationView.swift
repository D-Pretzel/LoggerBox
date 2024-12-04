//
//  SwiftUIView.swift
//  LoggerBox
//
//  Created by David Petzold on 12/3/24.
//

import SwiftUI

struct MainNavigationView: View {
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }

                LoggerView()
                    .tabItem {
                        Label("Logger", systemImage: "headset.circle")
                    }

                ChainsawView()
                    .tabItem {
                        Label("Chainsaw", systemImage: "list.bullet.clipboard")
                    }

                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .navigationBarTitle("LoggerBox", displayMode: .automatic)
        }
        .accentColor(Color.blue)
    }
}

#Preview {
    MainNavigationView()
}
