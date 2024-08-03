import UIKit

/// Экран рекомендаций для вас
final class ForYouViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Constants
    private enum Constants {
        static let backgroundColor: UIColor = .white
    }
    
    private var forYouLabel = UILabel()
    private var avatarImageView = UIImageView()
    private let defaults = UserDefaults.standard
    private var separatorLine = UIView()
    private var newsForYouLabel = UILabel()
    private var itemView = UIView()
    private var itemImage = UIImageView()
    private var orderSentLabel = UILabel()
    private var itemInfoLabel = UILabel()
    private var itemSeparatorLine = UIView()
    private var progressLine = UIProgressView()
    private var startProgressLabel = UILabel()
    private var middleProgressLabel = UILabel()
    private var finalProgressLabel = UILabel()
    private var recommendedForYouLabel = UILabel()
    private var getNewsImageView = UIImageView()
    private var getNewsLabel = UILabel()
    private var turnOnLabel = UILabel()
    private var recommendedButton = UIButton(type: .system)
    private var yourDeviceLabel = UILabel()
    private var showAllButton = UIButton(type: .system)
    private let picker = UIImagePickerController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        setupUI()
        picker.delegate = self
    }
    
    // MARK: - Private Method
    private func setupUI() {
        setupForYouLabel()
        setupAvatarImageView()
        setupForSeparatorLine()
        setupNewsForYou()
        setupForItemView()
        setupForItemImage()
        setupOrderSent()
        setupItemInfo()
        setupItemSeparatorLine()
        setupProgressLine()
        setupStartProgressLabel()
        setupMiddleProgressLabel()
        setupFinalProgressLabel()
        setupRecommendedForYouLabel()
        setupGetNewsImageView()
        setupGetNewsLabel()
        setupTurnOnLabel()
        setupRecommendedButton()
        setupYourDevice()
        setupShowAllButton()
    }
    
    private func setupForYouLabel() {
        forYouLabel.frame = CGRect(x: 20, y: 100, width: 150, height: 30)
        forYouLabel.text = "Для вас"
        forYouLabel.textColor = .black
        forYouLabel.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(forYouLabel)
    }
    
    private func setupAvatarImageView() {
        avatarImageView.frame = CGRect(x: 350, y: 100, width: 40, height: 40)
        avatarImageView.image = UIImage(systemName: "person.circle")
        avatarImageView.tintColor = .lightGray
        avatarImageView.isUserInteractionEnabled = true
        
        if (UserDefaults.standard.object(forKey: "Avatar") as? NSData) != nil {
            let photo = UserDefaults.standard.object(forKey: "Avatar") as! NSData
            avatarImageView.image = UIImage(data: photo as Data)
        } else {
            avatarImageView.image = UIImage(systemName: "person.circle")
            avatarImageView.tintColor = .lightGray
        }
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.clipsToBounds = true
        
        //Делаем тап для реагирования нажатия на аватарку
        let tap = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tap)
        
        view.addSubview(avatarImageView)
    }
    
    @objc private func avatarTapped() {
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let defaults = UserDefaults.standard
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        avatarImageView.image = image
        let saveImage = image.pngData() as NSData?
        //Сохраняем изображение в UserDefaults
        defaults.set(saveImage, forKey: "Avatar")
        picker.dismiss(animated: true)
    }
    
    private func setupForSeparatorLine() {
        separatorLine.frame = CGRect(x: 20, y: 150, width: 375, height: 1)
        separatorLine.backgroundColor = .lightGray
        view.addSubview(separatorLine)
    }
    
    private func setupNewsForYou() {
        newsForYouLabel.frame = CGRect(x: 20, y: 180, width: 200, height: 30)
        newsForYouLabel.text = "Вот что нового"
        newsForYouLabel.font = UIFont.boldSystemFont(ofSize: 27)
        newsForYouLabel.textColor = .black
        view.addSubview(newsForYouLabel)
    }
    
    private func setupForItemView() {
        itemView.frame = CGRect(x: 20, y: 220, width: 375, height: 170)
        itemView.isUserInteractionEnabled = false
        itemView.backgroundColor = .white
        itemView.layer.cornerRadius = 10
        itemView.layer.shadowColor = UIColor.black.cgColor
        itemView.layer.shadowOpacity = 0.3
        itemView.layer.shadowOffset = CGSize(width: 5, height: 5)
        itemView.layer.shadowRadius = 10
        view.addSubview(itemView)
    }
    
    private func setupForItemImage() {
        itemImage.frame = CGRect(x: 50, y: 240, width: 70, height: 70)
        itemImage.image = UIImage(named: "airpods pro")
        view.addSubview(itemImage)
    }
    
    private func setupOrderSent() {
        orderSentLabel.frame = CGRect(x: 130, y: 250, width: 170, height: 15)
        orderSentLabel.text = "Ваш заказ отправлен."
        orderSentLabel.textColor = .black
        orderSentLabel.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(orderSentLabel)
    }
    
    private func setupItemInfo() {
        itemInfoLabel.frame = CGRect(x: 130, y: 275, width: 170, height: 15)
        itemInfoLabel.text = "1 товар, доставка завтра"
        itemInfoLabel.textColor = .lightGray
        itemInfoLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(itemInfoLabel)
    }
    
    private func setupItemSeparatorLine() {
        itemSeparatorLine.frame = CGRect(x: 20, y: 320, width: 375, height: 0.5)
        itemSeparatorLine.backgroundColor = .lightGray
        view.addSubview(itemSeparatorLine)
    }
    
    private func setupProgressLine() {
        progressLine.frame = CGRect(x: 40, y: 340, width: 340, height: 30)
        progressLine.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
        progressLine.progress = 0.5
        progressLine.progressTintColor = .systemGreen
        view.addSubview(progressLine)
    }
    
    private func setupStartProgressLabel() {
        startProgressLabel.frame = CGRect(x: 40, y: 360, width: 100, height: 10)
        startProgressLabel.text = "Обрабатывается"
        startProgressLabel.textColor = .black
        startProgressLabel.font = UIFont.boldSystemFont(ofSize: 10)
        view.addSubview(startProgressLabel)
    }
    
    private func setupMiddleProgressLabel() {
        middleProgressLabel.frame = CGRect(x: 170, y: 360, width: 100, height: 10)
        middleProgressLabel.text = "Отправлено"
        middleProgressLabel.textColor = .black
        middleProgressLabel.font = UIFont.boldSystemFont(ofSize: 10)
        view.addSubview(middleProgressLabel)
    }
    
    private func setupFinalProgressLabel() {
        finalProgressLabel.frame = CGRect(x: 310, y: 360, width: 100, height: 10)
        finalProgressLabel.text = "Доставлено"
        finalProgressLabel.textColor = .lightGray
        finalProgressLabel.font = UIFont.boldSystemFont(ofSize: 10)
        view.addSubview(finalProgressLabel)
    }
    
    private func setupRecommendedForYouLabel() {
        recommendedForYouLabel.frame = CGRect(x: 20, y: 450, width: 300, height: 30)
        recommendedForYouLabel.text = "Рекомендуется вам"
        recommendedForYouLabel.textColor = .black
        recommendedForYouLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(recommendedForYouLabel)
    }
    
    private func setupGetNewsImageView() {
        getNewsImageView.frame = CGRect(x: 40, y: 500, width: 50, height: 50)
        getNewsImageView.image = UIImage(systemName: "app.badge")
        getNewsImageView.tintColor = .red
        view.addSubview(getNewsImageView)
    }
    
    private func setupGetNewsLabel() {
        getNewsLabel.frame = CGRect(x: 100, y: 480, width: 250, height: 100)
        getNewsLabel.text = "Получайте новости о своем заказе в режиме реального времени."
        getNewsLabel.textColor = .black
        getNewsLabel.font = UIFont.boldSystemFont(ofSize: 15)
        getNewsLabel.textAlignment = .left
        getNewsLabel.numberOfLines = 0
        view.addSubview(getNewsLabel)
    }
    
    private func setupTurnOnLabel() {
        turnOnLabel.frame = CGRect(x: 100, y: 530, width: 250, height: 100)
        turnOnLabel.text = "Включите уведомления, чтобы получать новости о своем заказе."
        turnOnLabel.textColor = .lightGray
        turnOnLabel.font = UIFont.systemFont(ofSize: 15)
        turnOnLabel.numberOfLines = 0
        turnOnLabel.textAlignment = .left
        view.addSubview(turnOnLabel)
    }
    
    private func setupRecommendedButton() {
        recommendedButton.frame = CGRect(x: 360, y: 545, width: 20, height: 20)
        recommendedButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        recommendedButton.tintColor = .lightGray
        view.addSubview(recommendedButton)
    }
    
    private func setupYourDevice() {
        yourDeviceLabel.frame = CGRect(x: 20, y: 750, width: 250, height: 26)
        yourDeviceLabel.text = "ваши устройства"
        yourDeviceLabel.textColor = .black
        yourDeviceLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(yourDeviceLabel)
    }
    
    private func setupShowAllButton() {
        showAllButton.frame = CGRect(x: 250, y: 750, width: 200, height: 30)
        showAllButton.setTitle("Показать все", for: .normal)
        showAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        view.addSubview(showAllButton)
    }
}
