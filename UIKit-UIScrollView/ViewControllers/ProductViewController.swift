import UIKit

/// Экран продукта
final class ProductViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let backgroundColor: UIColor = .black
    }
    
    var productNameLabel = UILabel()
    var priceProductLabel = UILabel()
    var scrollViewProduct = UIScrollView()
    private let imageProduct = UIImageView()
    private let imageProduct1 = UIImageView()
    private let imageProduct2 = UIImageView()
    var nameProduct1 = ""
    var nameProduct2 = ""
    var nameProduct3 = ""
    private let buyButtun = UIButton(type: .system)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        allUI()
    }
    
    // MARK: - Private Methods
    private func allUI() {
        createNameProductLabel()
        createPriceLabel()
        createScrollView()
        createImageProduct()
        createButton()
        createNavControllerButton()
    }
    
    private func createNameProductLabel() {
        productNameLabel.frame = CGRect(x: 0, y: 50, width: 250, height: 100)
        productNameLabel.center.x = view.center.x
        productNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        productNameLabel.textColor = .white
        productNameLabel.textAlignment = .center
        view.addSubview(productNameLabel)
    }
    
    private func createPriceLabel() {
        priceProductLabel.frame = CGRect(x: 0, y: 110, width: 60, height: 30)
        priceProductLabel.center.x = view.center.x
        priceProductLabel.font = UIFont.systemFont(ofSize: 16)
        priceProductLabel.textColor = .lightGray
        priceProductLabel.textAlignment = .center
        view.addSubview(priceProductLabel)
    }
    
    private func createScrollView() {
        scrollViewProduct.frame = CGRect(x: 0, y: 200, width: view.bounds.width, height: 213)
        scrollViewProduct.contentSize = CGSize(width: view.bounds.width * 3, height: scrollViewProduct.bounds.height)
        scrollViewProduct.isPagingEnabled = true
        scrollViewProduct.indicatorStyle = .white
//        scrollViewProduct.backgroundColor = .white
        view.addSubview(scrollViewProduct)
    }
    
    private func createImageProduct() {
        var imageViewRect = self.scrollViewProduct.bounds
        imageProduct.frame = CGRect(x: 0, y: 0, width:view.bounds.width, height: 213)
        imageProduct.image = UIImage(named: nameProduct1)
        imageProduct.contentMode = .scaleAspectFit
        scrollViewProduct.addSubview(imageProduct)
        
        imageViewRect.origin.x += imageViewRect.size.width
        imageProduct1.frame = imageViewRect
        imageProduct1.contentMode = .scaleAspectFit
        imageProduct1.image = UIImage(named: nameProduct2)
        scrollViewProduct.addSubview(imageProduct1)
        
        imageViewRect.origin.x += imageViewRect.size.width
        imageProduct2.frame = imageViewRect
        imageProduct2.contentMode = .scaleAspectFit
        imageProduct2.image = UIImage(named: nameProduct3)
        scrollViewProduct.addSubview(imageProduct2)
    }
    
    private func createButton() {
        buyButtun.frame = CGRect(x: 0, y: 700, width: 150, height: 40)
        buyButtun.center.x = view.center.x
        buyButtun.setTitle("Добавить в корзину", for: .normal)
        buyButtun.setTitleColor(.white, for: .normal)
        buyButtun.backgroundColor = .systemBlue
        buyButtun.layer.cornerRadius = 10
        view.addSubview(buyButtun)
    }
    
    private func createNavControllerButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Поиск"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let rightLikeBarButtonItem = UIBarButtonItem(image: .init(systemName: "heart"), style: .done, target: self, action: nil)
        let rightShareBarButtonItem = UIBarButtonItem(image: .init(systemName: "square.and.arrow.up"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [rightLikeBarButtonItem, rightShareBarButtonItem]
    }
}
