import UIKit
import SnapKit



class PizzaSizeCell: UICollectionViewCell {
    
    private lazy var cellButton: UIButton = MakerView.makerView.createButton(
        text: "8 inch", textColor: UIColor(hex: "#959595"), fontSize: 16, cornerRadius: 10, backgroundColor: .white,
        shadowOpacity: 0.2, shadowOffsetWidth: 2, shadowOffsetHeight: 2, shadowRadius: 4.0, shadowColor: .darkGray
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellButton)
        
        cellButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(86)
            make.height.equalTo(38)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDataCell(buttonText: String) {
        cellButton.setTitle(buttonText, for: .normal)
    }
}
