import UIKit
import SnapKit



class ViewController: UIViewController {

    private let pizzaSizes: [PizzaSizes] = [
        .init(size: "8 inch"),
        .init(size: "12 inch"),
        .init(size: "14 inch"),
        .init(size: "16 inch"),
        .init(size: "20 inch"),
        .init(size: "32 inch"),
    ]
    
    private let pizzaCellIdentifier = "pizzaCell"
    
    private let pizzaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 86, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 46
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    private lazy var pizzaTitleLabel: UILabel = MakerView.makerView.createLabel(
        text: "Pizza with Mushrooms", fontSize: 38, fontWeight: .bold, numberOfLines: 2, textAlignment: .center
    )
    
    private lazy var pizzaImageView: UIImageView = MakerView.makerView.createImage(
        image: UIImage(named: "pizza")
    )
    
    private lazy var pizzaDescription: UILabel = MakerView.makerView.createLabel(
        text: "Choose the size", fontSize: 22, fontWeight: .semibold, textAlignment: .center
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {
        view.backgroundColor = .white
        
        pizzaCollectionView.dataSource = self
        pizzaCollectionView.delegate = self
        pizzaCollectionView.allowsSelection = true
        pizzaCollectionView.register(PizzaSizeCell.self, forCellWithReuseIdentifier: pizzaCellIdentifier)
        
        pizzaTitleLabelLayout()
        pizzaImageViewLayout()
        pizzaDescriptionLayout()
        pizzaCollectionViewLayout()
    }
    
    private func pizzaTitleLabelLayout() {
        view.addSubview(pizzaTitleLabel)
        
        pizzaTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.horizontalEdges.equalToSuperview().inset(82)
        }
    }
    
    private func pizzaImageViewLayout() {
        view.addSubview(pizzaImageView)
        
        pizzaImageView.snp.makeConstraints { make in
            make.top.equalTo(pizzaTitleLabel.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
        }
    }
    
    private func pizzaDescriptionLayout() {
        view.addSubview(pizzaDescription)
        
        pizzaDescription.snp.makeConstraints { make in
            make.top.equalTo(pizzaImageView.snp.bottom).offset(43)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    private func pizzaCollectionViewLayout() {
        view.addSubview(pizzaCollectionView)
        
        pizzaCollectionView.snp.makeConstraints { make in
            make.top.equalTo(pizzaDescription.snp.bottom).offset(43)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pizzaSizes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pizzaCellIdentifier, for: indexPath) as! PizzaSizeCell
        cell.setupDataCell(buttonText: pizzaSizes[indexPath.row].size)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell \(indexPath.row) clicked")
    }
    
}
