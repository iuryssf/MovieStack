//
//  TabBarConfigurator.swift
//  MovieStack
//
//  Created by Iury Faria on 11/08/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createMovieStackVC(), createSearchNC(), createWatchLaterVC()]        
    }
    
    func createMovieStackVC() -> UINavigationController {
        let movieStackVC = MovieStackVC()
        movieStackVC.title = "Home"
        movieStackVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        
        return UINavigationController(rootViewController: movieStackVC)
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createWatchLaterVC() -> UINavigationController {
        let watchLaterVC = WatchLaterVC()
        watchLaterVC.title = "Watch Later"
        watchLaterVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        return UINavigationController(rootViewController: watchLaterVC)
    }
}
