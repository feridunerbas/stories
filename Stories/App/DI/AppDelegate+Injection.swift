//
//  AppDelegate+Injection.swift
//  Stories
//
//  Created by Feridun Erbas on 23.04.2020.
//  Copyright © 2020 Feridun Erbas. All rights reserved.
//

import Resolver

extension Resolver: ResolverRegistering {
	
	public static func registerAllServices() {
		registerStoryPlayer()
	}
	
}
