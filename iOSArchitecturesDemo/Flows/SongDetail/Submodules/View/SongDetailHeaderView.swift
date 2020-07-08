//
//  SongDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Denis on 08.07.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderView: UIView {

    private(set) lazy var artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var openButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Открыть", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.contentMode = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.addSubview(self.artworkImageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.artistLabel)
        self.addSubview(self.openButton)
        self.addSubview(self.collectionNameLabel)
        
        NSLayoutConstraint.activate([
            self.artworkImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.artworkImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.artworkImageView.widthAnchor.constraint(equalToConstant: 120.0),
            self.artworkImageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.artworkImageView.rightAnchor, constant: 16.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.artistLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
            self.artistLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor),
            self.artistLabel.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor),
            
            self.openButton.leftAnchor.constraint(equalTo: self.artworkImageView.rightAnchor, constant: 16.0),
            self.openButton.bottomAnchor.constraint(equalTo: self.artworkImageView.bottomAnchor),
            self.openButton.widthAnchor.constraint(equalToConstant: 80.0),
            self.openButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            self.collectionNameLabel.topAnchor.constraint(equalTo: self.artworkImageView.bottomAnchor, constant: 24.0),
            self.collectionNameLabel.leftAnchor.constraint(equalTo: self.artworkImageView.leftAnchor),
            self.collectionNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.collectionNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
