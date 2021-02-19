//
//  AppDelegate.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let auth = requestFactory.makeAuthRequestFatory()
//        auth.login(userName: "MocUser", password: "MocPassword") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        let regFactory = requestFactory.makeRegistrationRequestFatory()
//        regFactory.registration(
//            userId: 11,
//            userName: "Test",
//            password: "Pass",
//            email: "a@a.com",
//            gender: "m",
//            creditCard: "9872389-2424-234224-234",
//            bio: "This is good! I think I will switch to another language") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        let changeFactory = requestFactory.makeChangeUserRequestFactory()
//        
//        changeFactory.changeUserData(
//            userId: 12,
//            userName: "NO",
//            password: "Data",
//            email: "a@a.com",
//            gender: "m",
//            creditCard: "9872389-2424-234224-234",
//            bio: "This is good! I think I will switch to another language") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        let logoutFactory = requestFactory.makeLogoutRequestFatory()
//        logoutFactory.logout(userId: 1) { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        let catalog = requestFactory.makeFetchCatalogFactory()
        catalog.getCatalog(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
//        let good = requestFactory.makeFetchGoodFactory()
//        good.fetchGoodById(idProduct: 1) { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        return true
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

