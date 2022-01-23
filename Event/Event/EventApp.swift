//
//  EventApp.swift
//  Event
//
//  Created by Aydın Serhat Sezen on 19.01.2022.
//

import SwiftUI

@available(iOS 14.0, *)
struct EventApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


@main
struct EventWrapper {
    static func main() {
        if #available(iOS 14.0, *) {
            EventApp.main()
        }
        else {
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(SceneDelegate.self))
        }
    }
}

