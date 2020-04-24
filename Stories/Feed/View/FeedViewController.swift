//
//  FeedViewController.swift
//  Stories
//
//  Created by Feridun Erbas on 23.04.2020.
//  Copyright © 2020 Feridun Erbas. All rights reserved.
//

import UIKit

class FeedViewController: BaseViewController<FeedViewModel> {

	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.initializeCollectionView()
    }

}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return collectionView.bounds.size
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}

extension FeedViewController: UICollectionViewDataSource {
	
	private func initializeCollectionView() {
		let nibName = String(describing: StoryGroupCell.self)
		let nib = UINib.init(nibName: nibName, bundle: nil)
		self.collectionView.register(nib, forCellWithReuseIdentifier: nibName)
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoryGroupCell.self), for: indexPath) as! StoryGroupCell
		
		cell.backgroundColor = UIColor.randomColor()
		
		return cell
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
}

extension FeedViewController {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		print("offset: ", scrollView.contentOffset.x)
		translateScrollPosition(x: scrollView.contentOffset.x)
	}
	
	private func translateScrollPosition(x: CGFloat) {
		let cellWidth = self.collectionView.frame.width
		let percent = ( x / cellWidth + 1).truncatingRemainder(dividingBy: 1)
		let rightPosition = Int((x + cellWidth) / cellWidth)
		let leftPosition = rightPosition - 1
		
		
		if let rightCell = collectionView.cellForItem(at: .init(item: rightPosition , section: 0)) {
			let layer = rightCell.layer
			var rotationAndPerspectiveTransform = CATransform3DIdentity
			rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, -cellWidth/2, 0, 0)
			rotationAndPerspectiveTransform.m34 = 1.0 / -500
			rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, (1 - percent) * .pi / 2, 0.0, 1.0, 0.0)
			rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, cellWidth/2, 0, 0)
			layer.transform = rotationAndPerspectiveTransform
		}

		
		if let leftCell = collectionView.cellForItem(at: .init(item: leftPosition , section: 0)) {
			let layer = leftCell.layer
			var rotationAndPerspectiveTransform = CATransform3DIdentity
			rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, cellWidth/2, 0, 0)
			rotationAndPerspectiveTransform.m34 = 1.0 / 500
			rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, percent * .pi / 2, 0.0, 1.0, 0.0)
			rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, -cellWidth/2, 0, 0)
			
			layer.transform = rotationAndPerspectiveTransform
		}
	
	}
	
}

extension UIColor {
    class func randomColor(randomAlpha: Bool = false) -> UIColor {
        let redValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let greenValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let blueValue = CGFloat(arc4random_uniform(255)) / 255.0;
        let alphaValue = randomAlpha ? CGFloat(arc4random_uniform(255)) / 255.0 : 1;

        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
}
