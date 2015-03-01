//
//  Player.swift
//  XMLTest-Swift
//
//  Created by Brian Thompson on 2/25/15.
//  Copyright (c) 2015 by Brian Thompson. All rights reserved.
//

import Foundation

enum RPGClass: Int {
	case RPGClassFighter
	case RPGClassRogue
	case RPGClassWizard

	case RPGClassUnknown
	
	init () {
		self = RPGClassUnknown
	}

	init (strValue: String) {
		switch strValue {
			case "Fighter":
				self = RPGClassFighter
			
			case "Rogue":
				self = RPGClassRogue
			
			case "Wizard":
				self = RPGClassWizard
			
			default:
				self = RPGClassUnknown
		}
	}
	
	func stringValue() -> String {
		switch self {
		case .RPGClassFighter:
			return "Fighter"
			
		case .RPGClassRogue:
			return "Rogue"
			
		case .RPGClassWizard:
			return "Wizard"
			
		case .RPGClassUnknown:
			return "Unknown"
			
		default:
			return "Unknown"
		}
	}
}

class Player {
	var name: String
	var level: Int
	var rpgClass: RPGClass
	
	init (plName: String, plLevel: Int, plClass: RPGClass) {
		self.name = plName
		self.level = plLevel
		self.rpgClass = plClass
	}
	
	func stringValue() -> String {
		return "\(name) has level \(level) with class \(rpgClass.stringValue())"
	}
}