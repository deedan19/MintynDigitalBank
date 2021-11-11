//
//  SettingsModel.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import Foundation

struct SettingsModel {
    let icon: String
    let title: String
    var profileSettings: [String]?
}



let settingsData: [SettingsModel] = [
    SettingsModel(icon: "person.fill", title: "Profile", profileSettings: ["   Personal Information", "   Employment Information", "   Identification Information", "   Next of kin"]),
    SettingsModel(icon: "creditcard", title: "Account Management"),
    SettingsModel(icon: "speaker.wave.2", title: "Refferals"),
    SettingsModel(icon: "textformat.size.smaller.hi", title: "Legal"),
    SettingsModel(icon: "square.and.pencil", title: "Help and Support"),
    SettingsModel(icon: "doc.fill", title: "System"),
    SettingsModel(icon: "arrow.triangle.2.circlepath", title: "Create Business Account"),
    SettingsModel(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
]

