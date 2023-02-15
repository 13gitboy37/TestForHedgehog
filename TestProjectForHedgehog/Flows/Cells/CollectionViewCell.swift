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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "ADAweASDASD"
        label.textColor = .black
        return label
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
        self.backgroundColor = .blue
        
//        addLabel()
    }
    
    private func addLabel() {
        self.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.margins.equalTo(contentView)
        }
    }
    
    func configure() {

    }
}
