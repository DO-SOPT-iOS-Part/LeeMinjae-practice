//
//  ImageCollectionViewCell.swift
//  sopt33-third-seminar
//
//  Created by 민 on 10/28/23.
//

import UIKit

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ImageCollectionViewCell"
    weak var delegate: ItemSelectedProtocol?
    var itemRow: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(data: ImageCollectionData,
                  row: Int) {
        self.imageView.image = UIImage(named: data.image)
        self.likeButton.isSelected = data.isLiked
        self.itemRow = row
    }
    
    private func setLayout() {
        [imageView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc private func likeButtonTap() {
        self.likeButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.getButtonState(state: self.likeButton.isSelected,
                                          row: itemRow)
        }
    }
    
    private let imageView = UIImageView()
    private lazy var likeButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(likeButtonTap),
                     for: .touchUpInside)
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
}
