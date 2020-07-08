//
//  SongCellTableViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by Denis on 08.07.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.trackNameLabel, self.artistNameLabel, self.collectionNameLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addTrackNameLabel()
        self.addArtistNameLabel()
        self.addCollectionNameLabel()
    }
    
    private func addTrackNameLabel() {
        self.contentView.addSubview(self.trackNameLabel)
        NSLayoutConstraint.activate([
            self.trackNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addArtistNameLabel() {
        self.contentView.addSubview(self.artistNameLabel)
        NSLayoutConstraint.activate([
            self.artistNameLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: 4.0),
            self.artistNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.artistNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addCollectionNameLabel() {
        self.contentView.addSubview(self.collectionNameLabel)
        NSLayoutConstraint.activate([
            self.collectionNameLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 4.0),
            self.collectionNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.collectionNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
}
