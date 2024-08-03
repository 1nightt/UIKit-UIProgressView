import UIKit

/// Экран корзины покупок
final class BasketViewController: UIViewController {
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
        myLabel.text = "Тут будет корзина для вас"
        myLabel.textAlignment = .center
        myLabel.numberOfLines = 0
        myLabel.textColor = .white
        myLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(myLabel)
    }

}
