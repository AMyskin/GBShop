//
//  GoodsRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol GoodsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol GoodsDataPassing {
    var dataStore: GoodsDataStore? { get }
}

final class GoodsRouter: NSObject, GoodsRoutingLogic, GoodsDataPassing {
    weak var viewController: GoodsViewController?

    // MARK: - Init

    init(viewController: GoodsViewController) {
        self.viewController = viewController
    }
    var dataStore: GoodsDataStore?

    // MARK: Routing

    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}

    // MARK: Navigation

    //func navigateToSomewhere(source: GoodsViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}

    // MARK: Passing data

    //func passDataToSomewhere(source: GoodsDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
