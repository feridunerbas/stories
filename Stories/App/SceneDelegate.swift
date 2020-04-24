//
//  SceneDelegate.swift
//  Stories
//
//  Created by Feridun Erbas on 23.04.2020.
//  Copyright © 2020 Feridun Erbas. All rights reserved.
//

import UIKit
import Resolver

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		self.launchApp(scene: scene)
	}

	private func launchApp(scene: UIWindowScene) {
		self.window = UIWindow(windowScene: scene)
		self.window?.makeKeyAndVisible()
		self.window?.rootViewController = self.initialViewController()
	}
	
	private func initialViewController() -> UIViewController {
		let vc: StoryPlayerViewController = Resolver.resolve()
		return vc
	}
}

