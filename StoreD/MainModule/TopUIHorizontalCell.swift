import UIKit

class TopUIHorizontalCell: UICollectionViewCell {
    static let reuseIdentifier = "HorizontalCollectionCell"

    private let mainTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let secondTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 44
        self.contentView.layer.cornerRadius = 44
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 2.0
    }

    private func setupUI() {
        contentView.addSubview(mainTextLabel)
        contentView.addSubview(secondTextLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainTextLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            secondTextLabel.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 2),
            secondTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            secondTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func configureCell(withMainText mainText: String, secondText: String) {
        contentView.backgroundColor = UIColor(named: "IconsColor")
        mainTextLabel.text = mainText
        secondTextLabel.text = secondText
    }
}

class MenuHorizontalCell: UICollectionViewCell {
    static let reuseIdentifier = "MenuHorizontalCell"
    private let mainTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let secondTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(withMainText mainText: String, secondText: String) {
        mainTextLabel.text = mainText
        secondTextLabel.text = secondText
    }

    private func setupUI() {
        contentView.addSubview(mainTextLabel)
        contentView.addSubview(secondTextLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainTextLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            secondTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            secondTextLabel.leadingAnchor.constraint(equalTo: mainTextLabel.trailingAnchor, constant: 130),
            secondTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            secondTextLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

class TopTextItemCell: UICollectionViewCell {
    static let reuseIdentifier = "MenuHorizontalCell"
    private let mainTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    private let settingsIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "gearshape")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 26)
        image.preferredSymbolConfiguration = symbolConfiguration

        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(withMainText mainText: String) {
        mainTextLabel.text = mainText
    }

    private func setupUI() {
        contentView.addSubview(mainTextLabel)
        contentView.addSubview(settingsIcon)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainTextLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            settingsIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            settingsIcon.leadingAnchor.constraint(equalTo: mainTextLabel.trailingAnchor, constant: 130),
            settingsIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            settingsIcon.bottomAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
