//
//  UIHelper.swift
//  MovieStack
//
//  Created by Iury Faria on 14/08/23.
//

import UIKit

struct UIHelper {    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 60)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = minimumItemSpacing
        flowLayout.minimumLineSpacing = 10
        
        return flowLayout
    }
}

