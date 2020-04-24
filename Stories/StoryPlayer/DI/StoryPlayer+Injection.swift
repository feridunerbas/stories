//
//  StoryPlayer+Injection.swift
//  Stories
//
//  Created by Feridun Erbas on 23.04.2020.
//  Copyright © 2020 Feridun Erbas. All rights reserved.
//

import Resolver

extension Resolver {
	
	static func registerStoryPlayer() {
		register { StoryPlayerViewController() }
		register { StoryPlayerViewModelImplementation() as StoryPlayerViewModel }
	}
	
}
