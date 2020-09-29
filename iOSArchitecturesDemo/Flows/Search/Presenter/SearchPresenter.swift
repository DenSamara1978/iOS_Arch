//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Bondarenko on 25.06.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    private let searchInteractor: SearchInteractorInput
    private let searchRouter: SearchRouterInput
    
    init (interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.searchInteractor = interactor
        self.searchRouter = router
    }
    
    private func requestApps(with query: String) {
        self.searchInteractor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }

    private func requestSongs(with query: String) {
         self.searchInteractor.requestSongs(with: query) { [weak self] result in
             guard let self = self else { return }
             self.viewInput?.throbber(show: false)
             result
                 .withValue { songs in
                     guard !songs.isEmpty else {
                         self.viewInput?.showNoResults()
                         return
                     }
                     self.viewInput?.hideNoResults()
                     self.viewInput?.searchResults = songs
                 }
                 .withError {
                     self.viewInput?.showError(error: $0)
             }
         }
    }
}

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        if viewInput?.tabBarController?.selectedIndex == 0 {
            self.requestApps(with: query)
        } else {
            self.requestSongs(with: query)
        }    }
    
    func viewDidSelectItem(_ item: Any) {
        self.searchRouter.openDetailsFor(item)
    }
}
