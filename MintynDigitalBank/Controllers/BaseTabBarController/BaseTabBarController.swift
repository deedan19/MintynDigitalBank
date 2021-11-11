

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
//            createNavControllers(viewController: TodayFixtureViewController(), title: "Today's Fixtures", imageName: "ball"),
//            createNavControllers(viewController: DifferentLeaguesViewController(), title: "Competitions", imageName: "soccer-field"),
           
        ]
    }
    
    fileprivate func createNavControllers (viewController: UIViewController, title: String, imageName: String) -> UIViewController{
        viewController.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
    
    
    
}

