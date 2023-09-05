//
//  MovieCell.swift
//  MovieStack
//
//  Created by Iury Faria on 14/08/23.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    var movieTitleLabel: UILabel!
    var movieImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with movie: Movie) {
        movieTitleLabel.text = movie.title
    }
    
    func configureTitleLabel() {
        movieTitleLabel = UILabel()
        contentView.addSubview(movieTitleLabel)
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    func configureImageView() {
        movieImageView = UIImageView()
        contentView.addSubview(movieImageView)
        movieImageView.backgroundColor = .gray
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            movieImageView.bottomAnchor.constraint(equalTo: movieTitleLabel.topAnchor, constant: -10)
        ])
        
    }
}
