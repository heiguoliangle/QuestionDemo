//
//  HD_TSShoppingTVCell.swift
//  HD_TSShoppingMall_Example
//
//  Created by heiguoliangle on 2018/2/1.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class HD_TSShoppingTVCell: UITableViewCell {

    
    fileprivate var bookIcon : UIImageView!
    fileprivate var titleLabel : UILabel!
    fileprivate var descriptionLabel : UILabel!
    fileprivate var tagView : UIView!
    fileprivate var priceLabel : UILabel!
    fileprivate var shoppingCartBtn : UIButton!
    
    
    public var bookModel : HD_TSShoppingCellModel! {
        didSet {
            if let iconURL = URL.init(string: bookModel.libraryIconURL!) {
                bookIcon.kf.setImage(with: ImageResource(downloadURL: iconURL))
            }
            
            titleLabel.text = bookModel.libraryName
            descriptionLabel.text = bookModel.libraryDescription
            let priceStr =  bookModel.libraryNewPrice + "         " + bookModel.libraryOriginalPrice
            let allCount = priceStr.characters.count
            let newPriceCount = bookModel.libraryNewPrice.characters.count
            let oldRange = NSMakeRange(allCount - newPriceCount, newPriceCount)
            let attributeText = NSMutableAttributedString.init(string: priceStr)
            //设置删除线
            attributeText.addAttributes([NSAttributedStringKey.strikethroughStyle: 1], range: oldRange)
            attributeText.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.green], range: oldRange)
            
            priceLabel.attributedText = attributeText
            
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupSubviewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI (){
        
        bookIcon = UIImageView()
        contentView.addSubview(bookIcon)
        
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel()
        contentView.addSubview(descriptionLabel)
        
        tagView = UIView()
        tagView.backgroundColor = UIColor.randomColor()
        contentView.addSubview(tagView)
        
        priceLabel = UILabel()
        contentView.addSubview(priceLabel)
        
        shoppingCartBtn = UIButton()
        shoppingCartBtn.addTarget(self, action: #selector(addToShoppingCart), for: UIControlEvents.touchUpInside)
        contentView.addSubview(shoppingCartBtn)
        
    }
    
    
    
    fileprivate func setupSubviewLayout (){
    
        let topMargin = 10.0
        let bottomMargin = 10.0
        let leftMargin = 10.0
        let rightMargin = 10.0
        let labelLeftMargin = 20.0
        let iconW = 50.0
        let tagViewH = 30.0
        // 图片
        bookIcon.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(leftMargin)
            make.top.equalTo(contentView.snp.top).offset(topMargin)
            make.bottom.equalTo(contentView.snp.bottom).offset(-bottomMargin)
            make.width.equalTo(iconW)
        }
        
        //标题
        titleLabel.sizeToFit()
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bookIcon.snp.right).offset(labelLeftMargin)
            make.topMargin.equalTo(topMargin)
            
        }
        // 描述
//        descriptionLabel.sizeToFit()
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView).offset(-bottomMargin)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        shoppingCartBtn.snp.makeConstraints { (make) in
            
            make.right.equalTo(contentView.snp.right).offset(-rightMargin)
            make.bottom.equalTo(priceLabel.snp.bottom)
        }
        
        tagView.snp.makeConstraints { (make) in
            
            make.top.equalTo(descriptionLabel.snp.bottomMargin).offset(30)
            make.left.equalTo(titleLabel.snp.left)
            make.height.equalTo(tagViewH)
            make.width.equalTo(Double(self.bounds.size.width) - iconW - leftMargin - labelLeftMargin)
            
        }
    }

}

 // MARK: - 加入购物车
extension HD_TSShoppingTVCell{
    @objc fileprivate func addToShoppingCart(){
        print("点击了加入购物车")
    }
}

