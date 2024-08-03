import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let buyVC = BuyViewController()
        let forYouVC = ForYouViewController()
        let searchVC = SearchViewController()
        let basketVC = BasketViewController()
        
        buyVC.tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "macbook.and.iphone"), tag: 0)
        forYouVC.tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "person.circle"), tag: 1)
        searchVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "bag"), tag: 3)
        
        let buyNavVC = UINavigationController(rootViewController: buyVC)
        let forYouNavVC = UINavigationController(rootViewController: forYouVC)
        let searchNavVC = UINavigationController(rootViewController: searchVC)
        let basketNavVC = UINavigationController(rootViewController: basketVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [buyNavVC, forYouNavVC, searchNavVC, basketNavVC]
        tabBarController.tabBar.barStyle = .default
        tabBarController.selectedIndex = 1
        
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}

