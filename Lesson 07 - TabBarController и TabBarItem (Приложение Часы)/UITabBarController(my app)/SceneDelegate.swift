//
//  SceneDelegate.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 09.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UITabBarControllerDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowsScene)
        
        let firstVC = ViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        let fourVC = FourViewController()
        
        // Навигация
        let firstNavController = UINavigationController(rootViewController: firstVC)
        let secondNavController = UINavigationController(rootViewController: secondVC)
        let fourNavController = UINavigationController(rootViewController: fourVC)
        
        
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.tintColor = .systemOrange
        tabBarVC.tabBar.unselectedItemTintColor = .systemGray4
        tabBarVC.setViewControllers([firstNavController, secondNavController, thirdVC, fourNavController], animated: true)
        tabBarVC.delegate = self
        window.rootViewController = tabBarVC
        window.backgroundColor = .black
        
        secondVC.loadViewIfNeeded()
        thirdVC.loadViewIfNeeded()
        fourVC.loadViewIfNeeded()
        
        self.window = window
        window.makeKeyAndVisible()
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let selectIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else { return }
        
        switch selectIndex {
        case 0, 2:
            tabBarController.tabBar.backgroundColor = .black
        case 1, 3:
            tabBarController.tabBar.backgroundColor = .systemGray.withAlphaComponent(0.1)
        default:
            tabBarController.tabBar.backgroundColor = .black
        }
        
    func sceneDidDisconnect(_ scene: UIScene) {
            // Called as the scene is being released by the system.
            // This occurs shortly after the scene enters the background, or when its session is discarded.
            // Release any resources associated with this scene that can be re-created the next time the scene connects.
            // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        }
        
    func sceneDidBecomeActive(_ scene: UIScene) {
            // Called when the scene has moved from an inactive state to an active state.
            // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        }
        
    func sceneWillResignActive(_ scene: UIScene) {
            // Called when the scene will move from an active state to an inactive state.
            // This may occur due to temporary interruptions (ex. an incoming phone call).
        }
        
    func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
    func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
        
        
    }
    
}
