// Copyright © 2020 Shawn James. All rights reserved.
// MenuSections.swift

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum MenuSections: Int, CaseIterable, CustomStringConvertible {
    case user
    case standard
    case appSettings
    
    var description: String {
        switch self {
        case .user: return "User"
        case .standard: return "Standard"
        case .appSettings: return "Advanced Settings"
        }
    }
}

struct UserPresetOptions: SectionType {
    var description: String
    var containsSwitch: Bool { return false }
}

enum StandardPresetOptions: Int, CaseIterable, SectionType {
    case glider
    case jellyfish
    case spaceShip
    case random
    
    var containsSwitch: Bool { return false }
    
    var description: String {
        switch self {
        case .glider: return "Glider"
        case .jellyfish: return "Jellyfish"
        case .spaceShip: return "Spaceship"
        case .random: return "Random"
        }
    }
}

enum AppSettingsOptions: Int, CaseIterable, SectionType {
    case showGenerationLabel
    case help
    
    var containsSwitch: Bool {
        switch self {
        case .showGenerationLabel: return true
        case .help: return false
        }
    }
    
    var userDefaultsKey: String {
        switch self {
        case .showGenerationLabel: return .showGenerationKey
        case .help: return "nil"
        }
    }
    
    var description: String {
        switch self {
        case .showGenerationLabel: return "Show Generation Number"
        case .help: return "Help"
        }
    }
}
