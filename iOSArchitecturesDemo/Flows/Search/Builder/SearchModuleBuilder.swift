//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Bondarenko on 25.06.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilder {
    static func build() -> (UIViewController & SearchViewInput) {
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }
}
