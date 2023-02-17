//
//  CollectionViewCell.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - Propeties
    
    static let reuseId = "CollectionCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        addImageView()
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    private func addImageView() {
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.margins.equalTo(contentView)
            make.width.height.equalTo(contentView.frame.width)
        }
    }
    
    func configure(urlString: String) {
        imageView.kf.setImage(with: URL(string: urlString), placeholder: UIImage(systemName: "photo"))
    }
}
