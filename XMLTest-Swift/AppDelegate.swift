//
//  AppDelegate.swift
//  XMLTest-Swift
//
//  Created by Brian Thompson on 2/28/15.
//  Copyright (c) 2015 by Brian Thompson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var theParty: Party?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		self.theParty = PartyParser.loadParty()
		
		theParty?.players.append(Player(plName: "Elmo", plLevel: 1, plClass: RPGClass.RPGClassRogue))
		
		if let playersInParty = theParty?.players {
			for player in playersInParty {
				NSLog("%@", player.stringValue())
			}
		}
		
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// In order to test this in the iOS Simulator, you will have to open info.plist and add a setting, "Application does not run in background". The default value for this setting is "NO", change the default to "YES".
		//   Reference for this was http://stackoverflow.com/questions/7370853/forcing-a-background-application-to-terminate-in-ios-simulator
		
		if theParty != nil {
			PartyParser.saveParty(theParty!)
		}
	}
	
}

