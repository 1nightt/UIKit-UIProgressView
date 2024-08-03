import UIKit

/// Экран покупок
final class BuyViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let backgroundColor: UIColor = .black
    }
    
    private var myLabel = UILabel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        setupForLabel()
    }
    
    // MARK: - Private Method
    private func setupForLabel() {
        myLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        myLabel.center = view.center
        myLabel.text = "Скоро тут можно будет что-нибудь купить"
        myLabel.font = UIFont.systemFont(ofSize: 25)
        myLabel.textAlignment = .center
        myLabel.textColor = .white
        myLabel.numberOfLines = 0
        view.addSubview(myLabel)
    }
}

