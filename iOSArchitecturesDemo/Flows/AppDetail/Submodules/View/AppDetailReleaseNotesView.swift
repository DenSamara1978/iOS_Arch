//
//  AppDetailReleaseNotesView.swift
//  iOSArchitecturesDemo
//
//  Created by Denis on 07.07.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailReleaseNotesView: UIView {

    private(set) lazy var titleLabel: UILabel = {
        let titleLabel = UILabel ()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.text = "Что нового"
        return titleLabel
    } ()
    
    private(set) lazy var versionLabel: UILabel = {
        let versionLabel = UILabel ()
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.textColor = .lightGray
        versionLabel.font = UIFont.systemFont(ofSize: 14)
        return versionLabel
    } ()

    private(set) lazy var releaseNotesLabel: UILabel = {
        let releaseNotes = UILabel ()
        releaseNotes.translatesAutoresizingMaskIntoConstraints = false
        releaseNotes.textColor = .black
        releaseNotes.font = UIFont.systemFont(ofSize: 14)
        releaseNotes.numberOfLines = 0
        return releaseNotes
    } ()
    
    private(set) lazy var versionHistoryButton: UIButton = {
        let versionHistoryButton = UIButton (type: .system)
        versionHistoryButton.contentHorizontalAlignment = .right
        versionHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        versionHistoryButton.setTitle("История версий", for: .normal)
        return versionHistoryButton
    } ()
    
    private(set) lazy var releaseDateLabel: UILabel = {
        let releaseDateLabel = UILabel ()
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.textColor = .black
        releaseDateLabel.font = UIFont.systemFont(ofSize: 14)
        return releaseDateLabel
    } ()
    
    private(set) var leftStack: UIStackView = {
        let leftStack = UIStackView ()
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        leftStack.axis = .vertical
        leftStack.distribution = .fillEqually
        leftStack.alignment = .leading
        leftStack.spacing = 0
        return leftStack
    } ()
 
    private(set) var rightStack: UIStackView = {
        let rightStack = UIStackView ()
        rightStack.translatesAutoresizingMaskIntoConstraints = false
        rightStack.axis = .vertical
        rightStack.distribution = .fillEqually
        rightStack.alignment = .trailing
        rightStack.spacing = 0
        return rightStack
    } ()

    private(set) var topStack: UIStackView = {
        let topStack = UIStackView ()
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.axis = .horizontal
        topStack.distribution = .fillEqually
        topStack.alignment = .fill
        topStack.spacing = 8
        return topStack
    } ()

    private(set) var totalStack: UIStackView = {
        let totalStack = UIStackView ()
        totalStack.translatesAutoresizingMaskIntoConstraints = false
        totalStack.axis = .vertical
        totalStack.distribution = .fill
        totalStack.alignment = .fill
        totalStack.spacing = 8
        return totalStack
    } ()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.addSubview(self.leftStack)
        self.leftStack.addArrangedSubview(self.titleLabel)
        self.leftStack.addArrangedSubview(self.versionLabel)
        
        self.addSubview(self.rightStack)
        self.rightStack.addArrangedSubview(self.versionHistoryButton)
        self.rightStack.addArrangedSubview(self.releaseDateLabel)
        
        self.addSubview(self.topStack)
        self.topStack.addArrangedSubview(self.leftStack)
        self.topStack.addArrangedSubview(self.rightStack)
        
        self.addSubview(self.totalStack)
        self.totalStack.addArrangedSubview(self.topStack)
        self.totalStack.addArrangedSubview(self.releaseNotesLabel)
        
        NSLayoutConstraint.activate([
            self.totalStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.totalStack.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 12.0),
            self.totalStack.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -12.0),
            self.totalStack.bottomAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

}
