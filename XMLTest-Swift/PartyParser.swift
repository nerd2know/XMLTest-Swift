//
//  PartyParser.swift
//  XMLTest-Swift
//
//  Created by Brian Thompson on 2/28/15.
//  Copyright (c) 2015 by Brian Thompson. All rights reserved.
//

import Foundation

class PartyParser {

	class func loadParty() -> Party {
		let partyFilePath = NSBundle.mainBundle().pathForResource("Party", ofType: "xml")!
		var xmlData: NSData = NSData(contentsOfFile: partyFilePath)!
		var error: NSError?
		
		var doc: GDataXMLDocument! = GDataXMLDocument(data: xmlData, encoding: 0, error: &error)
		
		var party: Party = Party()
		
		if let docRootElement = doc.rootElement() {
			let partyMemberElements = docRootElement.elementsForName("Player") as [GDataXMLElement]
			
			for elem in partyMemberElements {
				var playerName: String
				var playerLevel: Int
				var playerClass: RPGClass
				
				let memberNameElem = elem.elementsForName("Name")?[0] as GDataXMLElement?
				let memberLevelElem = elem.elementsForName("Level")?[0] as GDataXMLElement?
				let memberClassElem = elem.elementsForName("Class")?[0] as GDataXMLElement?
				
				if memberNameElem != nil && memberLevelElem != nil && memberClassElem != nil {
					playerName = memberNameElem!.stringValue()
					playerLevel = memberLevelElem!.stringValue()?.toInt() ?? 0
					playerClass = RPGClass(strValue: memberClassElem!.stringValue())		// added an initializer to RPGClass that accepts a string, avoided breaking encapsulation
				} else {
					continue
				}
				
				party.players.append(Player(plName: playerName, plLevel: playerLevel, plClass: playerClass))
			}
		}
		
		return party
	}

	class func dataFilePath(forSave: Bool) -> String {
		let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
		let documentsDirectory: String = paths[0] as String
		let documentsPath: String = documentsDirectory.stringByAppendingPathComponent("Party.xml")
		
		if forSave || NSFileManager.defaultManager().fileExistsAtPath(documentsPath) {
			return documentsPath
		} else {
			return NSBundle.mainBundle().pathForResource("Party", ofType: "xml")!
		}
	}

	class func saveParty(theParty: Party) {
		var partyElement: GDataXMLElement = GDataXMLNode.elementWithName("Party")
		
		for player in theParty.players {
			var playerElement: GDataXMLElement = GDataXMLNode.elementWithName("Player")
			var nameElement: GDataXMLElement = GDataXMLNode.elementWithName("Name", stringValue: player.name)
			var levelElement: GDataXMLElement = GDataXMLNode.elementWithName("Level", stringValue: String(player.level))
			var classElement: GDataXMLElement = GDataXMLNode.elementWithName("Class", stringValue: player.rpgClass.stringValue())
			
			playerElement.addChild(nameElement)
			playerElement.addChild(levelElement)
			playerElement.addChild(classElement)
			
			partyElement.addChild(playerElement)
		}
		
		var document: GDataXMLDocument = GDataXMLDocument(rootElement: partyElement)
		var xmlData: NSData = document.XMLData()
		
		let filePath: String = self.dataFilePath(true)
		NSLog("Saving XML data to %@", filePath)
		xmlData.writeToFile(filePath, atomically: true)
	}
}
