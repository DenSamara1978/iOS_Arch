//
//  AppDetailReleaseNotesViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Denis on 07.07.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailReleaseNotesViewController: UIViewController {

    
    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var appDetailReleaseNotesView: AppDetailReleaseNotesView {
        return self.view as! AppDetailReleaseNotesView
    }
    
    //MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailReleaseNotesView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()        // Do any additional setup after loading the view.
    }
    
    private func fillData() {
        let view = self.appDetailReleaseNotesView
        view.versionLabel.text = "Версия \(app.version ?? "")"
        view.releaseNotesLabel.text = app.releaseNotes
        view.releaseDateLabel.text = "Дата релиза \(app.currentVersionReleaseDate ?? "")"
    }
}
