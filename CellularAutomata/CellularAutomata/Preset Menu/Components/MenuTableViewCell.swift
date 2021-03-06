// Copyright © 2020 Shawn James. All rights reserved.
// MenuTableViewCell.swift

import UIKit

class MenuTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else { return }
            textLabel?.text = sectionType.description
            
            switchControl.isHidden = !sectionType.containsSwitch
            if let setting = sectionType as? AppSettingsOptions {
                switchControl.isOn = UserDefaults.standard.bool(forKey: setting.userDefaultsKey)
            }
        }
    }
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = .red
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(handleSwitchToggle), for: .valueChanged)
        return switchControl
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(switchControl)
        switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    @objc private func handleSwitchToggle(sender: UISwitch) {
        guard let setting = sectionType as? AppSettingsOptions else { return }
        
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: setting.userDefaultsKey)
        } else { // .isOf
            UserDefaults.standard.set(false, forKey: setting.userDefaultsKey)
        }
    }

}
