//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Denis on 08.07.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderViewController: UIViewController {

    private let song: ITunesSong
    
    private let imageDownloader = ImageDownloader()
    
    private var songDetailHeaderView: SongDetailHeaderView {
        return self.view as! SongDetailHeaderView
    }

    // MARK: - Init
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()        // Do any additional setup after loading the view.
    }

    private func fillData() {
        self.downloadImage()
        self.songDetailHeaderView.titleLabel.text = song.trackName
        self.songDetailHeaderView.artistLabel.text = song.artistName
        self.songDetailHeaderView.collectionNameLabel.text = song.collectionName
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.songDetailHeaderView.artworkImageView.image = image
        }
    }
}
