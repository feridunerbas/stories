//
//  BaseViewController.swift
//  Stories
//
//  Created by Feridun Erbas on 23.04.2020.
//  Copyright © 2020 Feridun Erbas. All rights reserved.
//

import UIKit
import Resolver

class BaseViewController<T>: UIViewController{
    
    // MARK: -Initialization
    
	var viewModel: T! {
		didSet {
			baseViewModel = viewModel as? BaseViewModel
		}
	}
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.mutualInit()
    }
	
    required init?(coder: NSCoder) {
        super.init(coder: coder)
		self.mutualInit()
    }
	
	private func mutualInit() {
		self.viewModel = Resolver.optional()
		self.baseViewModel = viewModel as? BaseViewModel
	}
    
    private var baseViewModel: BaseViewModel?
	
    override var preferredStatusBarStyle: UIStatusBarStyle{
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    // MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseViewModel?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        baseViewModel?.viewDidAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        baseViewModel?.viewWillAppear()
    }
    
    deinit {
        print("\(String(describing: Self.self)) destructed")
    }
	
}

