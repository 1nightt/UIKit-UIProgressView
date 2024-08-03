import UIKit

/// Экран поиска
final class SearchViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let backgroundColor: UIColor = .black
        static let descriptionArray = ["AirPods Pro", "Iphone 15 Pro Max", "MacBook Pro M2", "AppleWatch S8"]
        
    }
    
    private var searchLabel = UILabel()
    private var searchTextField = UITextField()
    private let searchImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    private let searchView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 30,
                                                  height: 20))
    private var recentlyViewedLabel = UILabel()
    private var clearButton = UIButton(type: .system)
    
    private let variantLabel = UILabel()
    private let macImageView = UIImageView()
    private let macLabel = UILabel()
    private let iphoneImageView = UIImageView()
    private let iphoneLabel = UILabel()
    private let airpodsImageView = UIImageView()
    private let airpodsLabel = UILabel()
    private let appleWatchImageView = UIImageView()
    private let appleWatchLabel = UILabel()
    
    private let myScrollView = UIScrollView()
    
    private let point = 0
    private let recognizer = UITapGestureRecognizer()
    private let recognizer1 = UITapGestureRecognizer()
    private let recognizer2 = UITapGestureRecognizer()
    private let recognizer3 = UITapGestureRecognizer()
    
    
    private let macView = UIView()
    private let macImage = UIImageView()
    private let macScrollLabel = UILabel()
    
    private let iphoneView = UIView()
    private let iphoneImage = UIImageView()
    private let iphoneScrollLabel = UILabel()
    
    private let appleWatchView = UIView()
    private let appleWatchImage = UIImageView()
    private let appleWatchScrollLabel = UILabel()
    
    private let airpodsView = UIView()
    private let airpodsImage = UIImageView()
    private let airpodsScrollLabel = UILabel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        allUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Private Methods
    private func allUI() {
        setupForSearchLabel()
        setupForSearchTextField()
        setupForRecentlyViewedLabel()
        setupForClearButton()
        setupForVariantLabel()
        createAirPodsImage()
        setupForAirPodsLabel()
        createMacImage()
        setupForMacLabel()
        createAppleWatchImage()
        setupForAppleWatchLabel()
        createIphoneImage()
        setupForIphoneLabel()
        setupForScrollView()
        createMacView()
        createIphoneView()
        createAplleWatchView()
        createAirPodsView()
    }
    
    private func setupForSearchLabel() {
        searchLabel.frame = CGRect(x: 30, y: 100, width: 200, height: 50)
        searchLabel.text = "Поиск"
        searchLabel.textColor = .white
        searchLabel.textAlignment = .left
        searchLabel.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(searchLabel)
    }
    
    private func setupForSearchTextField() {
        searchTextField.frame = CGRect(x: 30, y: 150, width: view.bounds.width - 60, height: 34)
        searchTextField.borderStyle = .roundedRect
        searchTextField.textColor = .white
        createImageInsideTextField(textfield: searchTextField, view: searchView, imageView: searchImageView)
        searchTextField.backgroundColor = .secondaryLabel
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск по продуктам и магазинам",
                                                                   attributes: [NSAttributedString.Key.foregroundColor :
                                                                                    UIColor.lightGray])
        view.addSubview(searchTextField)
    }
    
    private func createImageInsideTextField(textfield: UITextField, view: UIView, imageView: UIImageView) {
        textfield.leftViewMode = .always
        imageView.frame = CGRect(x: 10, y: 0, width: 20, height: 20)
        imageView.tintColor = .lightGray
        imageView.contentMode = .center
        view.addSubview(imageView)
        textfield.leftView = view
    }
    
    private func setupForRecentlyViewedLabel() {
        recentlyViewedLabel.frame = CGRect(x: 30, y: 200, width: 300, height: 50)
        recentlyViewedLabel.text = "Недавно просмотренные"
        recentlyViewedLabel.textColor = .white
        recentlyViewedLabel.font = UIFont.boldSystemFont(ofSize: 20)
        recentlyViewedLabel.textAlignment = .left
        view.addSubview(recentlyViewedLabel)
    }
    
    private func setupForClearButton() {
        clearButton.frame = CGRect(x: 300, y: 200, width: 100, height: 50)
        clearButton.setTitle("Очистить", for: .normal)
        view.addSubview(clearButton)
    }
    
    private func setupForVariantLabel() {
        variantLabel.frame = CGRect(x: 30, y: 450, width: 200, height: 40)
        variantLabel.text = "Варианты запросов"
        variantLabel.textColor = .white
        variantLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(variantLabel)
    }
    
    private func createAirPodsImage() {
        airpodsImageView.frame = CGRect(x: 30, y: 495, width: 20, height: 20)
        airpodsImageView.image = .init(systemName: "magnifyingglass")
        airpodsImageView.tintColor = .lightGray
        view.addSubview(airpodsImageView)
    }
    
    private func setupForAirPodsLabel() {
        airpodsLabel.frame = CGRect(x: 60, y: 490, width: 100, height: 30)
        airpodsLabel.text = "AirPods"
        airpodsLabel.textColor = .white
        airpodsLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(airpodsLabel)
    }
    
    private func createMacImage() {
        macImageView.frame = CGRect(x: 30, y: 545, width: 20, height: 20)
        macImageView.image = .init(systemName: "magnifyingglass")
        macImageView.tintColor = .lightGray
        view.addSubview(macImageView)
    }
    
    private func setupForMacLabel() {
        macLabel.frame = CGRect(x: 60, y: 540, width: 150, height: 30)
        macLabel.text = "MacBook Pro M2"
        macLabel.font = UIFont.systemFont(ofSize: 20)
        macLabel.textColor = .white
        view.addSubview(macLabel)
    }
    
    private func createAppleWatchImage() {
        appleWatchImageView.frame = CGRect(x: 30, y: 595, width: 20, height: 20)
        appleWatchImageView.image = .init(systemName: "magnifyingglass")
        appleWatchImageView.tintColor = .lightGray
        view.addSubview(appleWatchImageView)
    }
    
    private func setupForAppleWatchLabel() {
        appleWatchLabel.frame = CGRect(x: 60, y: 590, width: 150, height: 30)
        appleWatchLabel.text = "Apple Watch S7"
        appleWatchLabel.textColor = .white
        appleWatchLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(appleWatchLabel)
    }
    
    private func createIphoneImage() {
        iphoneImageView.frame = CGRect(x: 30, y: 645, width: 20, height: 20)
        iphoneImageView.image = .init(systemName: "magnifyingglass")
        iphoneImageView.tintColor = .lightGray
        view.addSubview(iphoneImageView)
    }
    
    private func setupForIphoneLabel() {
        iphoneLabel.frame = CGRect(x: 60, y: 640, width: 200, height: 30)
        iphoneLabel.text = "Iphone 15 Pro Max"
        iphoneLabel.textColor = .white
        iphoneLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(iphoneLabel)
    }
    
    private func setupForScrollView() {
        myScrollView.frame = CGRect(x: 30, y: 250, width: 430, height: 200)
        myScrollView.contentSize = CGSize(width: 730, height: 200)
        myScrollView.backgroundColor = .black
        myScrollView.showsHorizontalScrollIndicator = false
        myScrollView.indicatorStyle = .white
        view.addSubview(myScrollView)
    }
    
    private func createMacView() {
        macView.frame = CGRect(x: point, y: 0, width: 150, height: 200)
        macView.backgroundColor = .darkGray
        macView.layer.cornerRadius = 15
        recognizer.addTarget(self, action: #selector(tapProduct))
        macView.addGestureRecognizer(recognizer)
        myScrollView.addSubview(macView)
        
        macImage.frame = CGRect(x: 0, y: 0, width: 130, height: 150)
        macImage.center.x = macView.center.x
        macImage.image = UIImage(named: "mac")
        macImage.contentMode = .scaleAspectFit
        macView.addSubview(macImage)
        
        macScrollLabel.frame = CGRect(x: 5, y: 135, width: 140, height: 60)
        macScrollLabel.text = Constants.descriptionArray[2]
        macScrollLabel.textColor = .white
        macScrollLabel.numberOfLines = 0
        macScrollLabel.font = UIFont.systemFont(ofSize: 14)
        macScrollLabel.textAlignment = .center
        macView.addSubview(macScrollLabel)
    }
    
    private func createIphoneView() {
        iphoneView.frame = CGRect(x: point + 170, y: 0, width: 150, height: 200)
        iphoneView.backgroundColor = .darkGray
        iphoneView.layer.cornerRadius = 15
        recognizer1.addTarget(self, action: #selector(tapProduct))
        iphoneView.addGestureRecognizer(recognizer1)
        myScrollView.addSubview(iphoneView)
        
        iphoneImage.frame = CGRect(x: 0, y: 0, width: 130, height: 150)
        iphoneImage.image = UIImage(named: "iphone")
        iphoneImage.center.x = macView.center.x
        iphoneImage.contentMode = .scaleAspectFit
        iphoneView.addSubview(iphoneImage)
        
        iphoneScrollLabel.frame = CGRect(x: 5, y: 135, width: 140, height: 60)
        iphoneScrollLabel.text = Constants.descriptionArray[1]
        iphoneScrollLabel.textColor = .white
        iphoneScrollLabel.textAlignment = .center
        iphoneScrollLabel.numberOfLines = 0
        iphoneScrollLabel.font = UIFont.systemFont(ofSize: 14)
        iphoneView.addSubview(iphoneScrollLabel)
    }
    
    private func createAplleWatchView() {
        appleWatchView.frame = CGRect(x: point + 340, y: 0, width: 150, height: 200)
        appleWatchView.backgroundColor = .darkGray
        appleWatchView.layer.cornerRadius = 15
        recognizer2.addTarget(self, action: #selector(tapProduct))
        appleWatchView.addGestureRecognizer(recognizer2)
        myScrollView.addSubview(appleWatchView)
        
        appleWatchImage.frame = CGRect(x: 0, y: 0, width: 130, height: 150)
        appleWatchImage.center.x = macView.center.x
        appleWatchImage.image = UIImage(named: "applewatch")
        appleWatchImage.contentMode = .scaleAspectFit
        appleWatchView.addSubview(appleWatchImage)
        
        appleWatchScrollLabel.frame = CGRect(x: 5, y: 135, width: 140, height: 60)
        appleWatchScrollLabel.text = Constants.descriptionArray[3]
        appleWatchScrollLabel.textColor = .white
        appleWatchScrollLabel.textAlignment = .center
        appleWatchScrollLabel.numberOfLines = 0
        appleWatchScrollLabel.font = UIFont.systemFont(ofSize: 14)
        appleWatchView.addSubview(appleWatchScrollLabel)
    }
    
    private func createAirPodsView() {
        airpodsView.frame = CGRect(x: 510, y: 0, width: 150, height: 200)
        airpodsView.backgroundColor = .darkGray
        airpodsView.layer.cornerRadius = 15
        recognizer3.addTarget(self, action: #selector(tapProduct))
        airpodsView.addGestureRecognizer(recognizer3)
        myScrollView.addSubview(airpodsView)
        
        airpodsImage.frame = CGRect(x: 0, y: 0, width: 130, height: 150)
        airpodsImage.center.x = macView.center.x
        airpodsImage.image = UIImage(named: "airpods")
        airpodsImage.contentMode = .scaleAspectFit
        airpodsView.addSubview(airpodsImage)
        
        airpodsScrollLabel.frame = CGRect(x: 5, y: 135, width: 140, height: 60)
        airpodsScrollLabel.text = Constants.descriptionArray[0]
        airpodsScrollLabel.textColor = .white
        airpodsScrollLabel.textAlignment = .center
        airpodsScrollLabel.font = UIFont.systemFont(ofSize: 14)
        airpodsScrollLabel.numberOfLines = 0
        airpodsView.addSubview(airpodsScrollLabel)
    }
    
    @objc private func tapProduct(_ gestureRecognizer: UITapGestureRecognizer) {
        let productPage = ProductViewController()
        self.navigationController?.pushViewController(productPage, animated: true)
        if gestureRecognizer == recognizer {
            productPage.productNameLabel.text = macScrollLabel.text ?? "nil"
            productPage.priceProductLabel.text = "1799$"
            productPage.nameProduct1 = "mac"
            productPage.nameProduct2 = "mac"
            productPage.nameProduct3 = "mac"
        } else if gestureRecognizer == recognizer1 {
            productPage.productNameLabel.text = iphoneScrollLabel.text ?? "nil"
            productPage.priceProductLabel.text = "999$"
            productPage.nameProduct1 = "iphone"
            productPage.nameProduct2 = "iphone"
            productPage.nameProduct3 = "iphone"
        } else if gestureRecognizer == recognizer2 {
            productPage.productNameLabel.text = appleWatchScrollLabel.text ?? "nil"
            productPage.priceProductLabel.text = "599$"
            productPage.nameProduct1 = "applewatch"
            productPage.nameProduct2 = "applewatch"
            productPage.nameProduct3 = "applewatch"
        } else {
            productPage.productNameLabel.text = airpodsScrollLabel.text ?? "nil"
            productPage.priceProductLabel.text = "180$"
            productPage.nameProduct1 = "airpods"
            productPage.nameProduct2 = "airpods"
            productPage.nameProduct3 = "airpods"
        }
    }
}
