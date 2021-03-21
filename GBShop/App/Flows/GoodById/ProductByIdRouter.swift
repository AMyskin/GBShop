//
//  ProductByIdRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol ProductByIdRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}



final class ProductByIdRouter:  ProductByIdRoutingLogic {
    weak var viewController: ProductByIdViewController?

    // MARK: - Init

    init(viewController: ProductByIdViewController) {
        self.viewController = viewController
    }
   

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

    //func navigateToSomewhere(source: ProductByIdViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}

    // MARK: Passing data

    //func passDataToSomewhere(source: ProductByIdDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
