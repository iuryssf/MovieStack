//
//  HomeVC.swift
//  MovieStack
//
//  Created by Iury Faria on 11/08/23.
//

import UIKit

class MovieStackVC: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
    }
    
    private let viewModel = MovieStackViewModel()
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
        configureDataSource()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Movie>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, movie) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
            cell.set(with: movie)
            return cell
        })
        // Initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.movies)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func updateData(with movies: [Movie]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
