//
//  FullScreenPhotosView.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 18.02.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class FullScreenPhotosView: UIView {
    
    //MARK: - Properties
    
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var centralImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left.circle.fill")?.withTintColor(.black,
                                                                                     renderingMode: .alwaysOriginal),
                        for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(prevImage), for: .touchUpInside)
        return button
    }()
    
    private lazy var originalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open original source", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right.circle.fill")?.withTintColor(.black,
                                                                                      renderingMode: .alwaysOriginal),
                        for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(nextImage), for: .touchUpInside)
        return button
    }()
    
    weak var viewController: FullScreenPhotoViewInput?
    
    //MARK: - Init
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.async {
            self.originalButton.layer.cornerRadius = self.originalButton.frame.size.height / 2
        }
    }
    
    private func addCentralImageView() {
        self.addSubview(centralImageView)
        
        centralImageView.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Layout.topMarginImage)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(Layout.bottomMarginImage)
        }
    }
    
    private func addRightImageView() {
        self.addSubview(rightImageView)
        
        rightImageView.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX).offset(Layout.imageOffset)
            make.width.equalTo(centralImageView)
            make.top.bottom.equalTo(centralImageView)
        }
    }
    
    private func addLeftImageView() {
        self.addSubview(leftImageView)
        
        leftImageView.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX).offset(-Layout.imageOffset)
            make.width.equalTo(centralImageView)
            make.top.bottom.equalTo(centralImageView)
        }
    }
    
    private func addLeftButton() {
        self.addSubview(leftButton)
        
        leftButton.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(Layout.buttonHorizontalMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(Layout.verticalMarginButton)
            make.width.height.equalTo(Size.widthAndHeight)
        }
    }
    
    private func addOriginalButton() {
        self.addSubview(originalButton)
        
        
        originalButton.snp.makeConstraints { make in
            make.leading.equalTo(leftButton.snp.trailing).offset(Layout.buttonHorizontalMargin)
            make.trailing.equalTo(rightButton.snp.leading).offset(-Layout.buttonHorizontalMargin)
            make.centerY.equalTo(leftButton.snp.centerY)
        }
    }
    
    private func addRightButton() {
        self.addSubview(rightButton)
        
        rightButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(Layout.buttonHorizontalMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(Layout.verticalMarginButton)
            make.width.height.equalTo(Size.widthAndHeight)
        }
    }
    
    //MARK: - Objc func
    
    @objc
    private func prevImage() {
        leftImageView.isHidden = false
        showLeftImage()
    }
    
    @objc
    private func nextImage() {
        rightImageView.isHidden = false
        showRightImage()
    }
    
    func configureUI() {
        self.backgroundColor = .white
        
        addCentralImageView()
        addLeftImageView()
        addRightImageView()
        addLeftButton()
        addRightButton()
        addOriginalButton()
    }
    
    func setupPhoto(_ urlArray: [String]) {
        let leftImageIndex = 0
        let centralImageIndex = 1
        let rightImageIndex = 2
        
        leftImageView.kf.setImage(with: URL(string: urlArray[leftImageIndex]),
                                  placeholder: UIImage(systemName: "photo"))
        centralImageView.kf.setImage(with: URL(string: urlArray[centralImageIndex]),
                                     placeholder: UIImage(systemName: "photo"))
        rightImageView.kf.setImage(with: URL(string: urlArray[rightImageIndex]),
                                   placeholder: UIImage(systemName: "photo"))
    }
}

extension FullScreenPhotosView {
    private enum Size {
        static let widthAndHeight: CGFloat = 50
    }
    
    private enum Layout {
        static let horizontalMargin: CGFloat = 50
        static let buttonHorizontalMargin: CGFloat = 10
        static let verticalMarginButton: CGFloat = 20
        static let topMarginImage: CGFloat = 50
        static let bottomMarginImage: CGFloat = 100
        static let imageOffset: CGFloat = 2000
    }
}

extension FullScreenPhotosView {
    
    private func showLeftImage() {
        let duration = 1.0
        
        UIImageView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: [],
            animations: {
                
                UIImageView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.5,
                    animations: {
                        self.centralImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    })
                UIImageView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5,
                    animations: {
                        self.centralImageView.snp.updateConstraints { make in
                            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX).offset(Layout.imageOffset)
                        }
                        
                        self.centralImageView.superview?.layoutIfNeeded()
                    })
                UIImageView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5,
                    animations: {
                        self.leftImageView.snp.updateConstraints { make in
                            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                        }
                        self.leftImageView.superview?.layoutIfNeeded()
                    })
            },
            completion: { isCompleted in
                self.centralImageView.transform = .identity
                self.viewController?.animationCompleted(direction: .left)
                self.leftImageView.isHidden = true
                self.centralImageView.snp.updateConstraints { make in
                    make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                }
                self.leftImageView.snp.updateConstraints { make in
                    make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX).offset(-Layout.imageOffset)
                }
            } )
    }
    
    func showRightImage() {
        let duration = 1.0
        
        UIImageView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: [],
            animations: {
                
                UIImageView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.5,
                    animations: {
                        self.centralImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    })
                UIImageView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5,
                    animations: {
                        self.centralImageView.snp.updateConstraints { make in
                            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX).offset(-Layout.imageOffset)
                        }
                        
                        self.centralImageView.superview?.layoutIfNeeded()
                    })
                UIImageView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5,
                    animations: {
                        self.rightImageView.snp.updateConstraints { make in
                            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                        }
                        self.rightImageView.superview?.layoutIfNeeded()
                    })
            },
            completion: { isCompleted in
                self.centralImageView.transform = .identity
                self.viewController?.animationCompleted(direction: .right)
                self.rightImageView.isHidden = true
                self.centralImageView.snp.updateConstraints { make in
                    make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
                }
                self.rightImageView.snp.updateConstraints { make in
                    make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX).offset(Layout.imageOffset)
                }
            } )
    }
}
