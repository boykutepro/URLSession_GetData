//
//  CustomCell.swift
//  URLSession_Practice
//
//  Created by Thien Tung on 5/7/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title:"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    } ()
    
    let titleContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    } ()
    
    let tagsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tags:"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    } ()
    
    let tagsContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    } ()
    
    let answerCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Answer Count:"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    } ()
    
    let answerCountContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    } ()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score:"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    } ()
    
    let scoreContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    } ()
    
    let linkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Link:"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    } ()
    
    let linkContentTextView: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.isScrollEnabled = false
        return label
    } ()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        addComponent()
        setupLayout()
        setupLink()
    }
    func addComponent() {
      self.addSubview(titleLabel)
      self.addSubview(titleContentLabel)
      self.addSubview(tagsLabel)
      self.addSubview(tagsContentLabel)
      self.addSubview(answerCountLabel)
      self.addSubview(answerCountContentLabel)
      self.addSubview(scoreLabel)
      self.addSubview(scoreContentLabel)
      self.addSubview(linkLabel)
      self.addSubview(linkContentTextView)
    }
    
    func setupLayout() {
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
      
      titleContentLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
      titleContentLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 16).isActive = true
      titleContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
      
      tagsLabel.topAnchor.constraint(equalTo: titleContentLabel.bottomAnchor, constant: 8).isActive = true
      tagsLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
      
      
      tagsContentLabel.topAnchor.constraint(equalTo: tagsLabel.topAnchor).isActive = true
      tagsContentLabel.leftAnchor.constraint(equalTo: tagsLabel.rightAnchor, constant: 16).isActive = true
      tagsContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
      
      answerCountLabel.topAnchor.constraint(equalTo: tagsContentLabel.bottomAnchor, constant: 8).isActive = true
      answerCountLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
      
      answerCountContentLabel.topAnchor.constraint(equalTo: answerCountLabel.topAnchor).isActive = true
      answerCountContentLabel.leadingAnchor.constraint(equalTo: answerCountLabel.trailingAnchor, constant: 8).isActive = true
      answerCountContentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
      
      scoreLabel.topAnchor.constraint(equalTo: answerCountContentLabel.bottomAnchor, constant: 8).isActive = true
      scoreLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
      
      scoreContentLabel.topAnchor.constraint(equalTo: scoreLabel.topAnchor).isActive = true
      scoreContentLabel.leftAnchor.constraint(equalTo: scoreLabel.rightAnchor, constant: 8).isActive = true
      scoreContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
      
      linkLabel.topAnchor.constraint(equalTo: scoreContentLabel.bottomAnchor, constant: 8).isActive = true
      linkLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
      
      linkContentTextView.topAnchor.constraint(equalTo: scoreContentLabel.bottomAnchor).isActive = true
      linkContentTextView.leftAnchor.constraint(equalTo: linkLabel.rightAnchor, constant: 16).isActive = true
      linkContentTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
      linkContentTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
    
    func setupLink() {
      let attributedString = NSMutableAttributedString.init(string: linkContentTextView.text ?? "")
      attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue,
                                    range: NSRange.init(location: 0, length: attributedString.length))
      attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1,
                                    range: NSRange.init(location: 0, length: attributedString.length))
      attributedString.addAttribute(NSAttributedString.Key.link, value: self.linkContentTextView.text ?? "",
                                    range: NSRange.init(location: 0, length: attributedString.length))
      linkContentTextView.attributedText = attributedString
      linkContentTextView.font = .systemFont(ofSize: 14)
    }
}
