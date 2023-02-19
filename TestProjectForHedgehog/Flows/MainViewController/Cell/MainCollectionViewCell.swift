//
//  CollectionViewCell.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class MainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Propeties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    static let reuseId = "CollectionCell"
    
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
    
    private func addImageView() {
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.margins.equalTo(contentView)
            make.width.height.equalTo(contentView.frame.size.width)
        }
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    func configure(urlString: String) {
        imageView.kf.setImage(with: URL(string: urlString), placeholder: UIImage(systemName: "photo"))
    }
}
