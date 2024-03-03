import UIKit

class RocketViewControllerAll: UIViewController {

    private let mainCollectionViewScreen: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5

        let mainCollectionViewScreen = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionViewScreen.collectionViewLayout = layout
        mainCollectionViewScreen.backgroundColor = UIColor.black
        mainCollectionViewScreen.layer.cornerRadius = 35
        mainCollectionViewScreen.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainCollectionViewScreen.clipsToBounds = true
        mainCollectionViewScreen.collectionViewLayout = layout
        mainCollectionViewScreen.register(TopUIHorizontalCell.self, forCellWithReuseIdentifier: "TopUIHorizontalCell")
        return mainCollectionViewScreen
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        mainCollectionViewScreen.delegate = self
        mainCollectionViewScreen.dataSource = self
    }

    init(index: Int) {
        super.init(nibName: nil, bundle: nil)

        switch index {
        case 0:
            view.backgroundColor = .green
        case 1:
            view.backgroundColor = .red
        case 2:
            view.backgroundColor = .blue
        case 3:
            view.backgroundColor = .yellow
        default:
            break
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - addSubViews

    func addSubviews() {
        view.addSubview(mainCollectionViewScreen)
        mainCollectionViewScreen.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - setupConstraints

    func setupConstraints () {
        NSLayoutConstraint.activate([
            mainCollectionViewScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionViewScreen.trailiniingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionViewScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCollectionViewScreen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.68),
        ])
    }
}

extension RocketViewControllerAll: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        13
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopUIHorizontalCell", for: indexPath) as? TopUIHorizontalCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(with: "Text for cell \(indexPath.row)")
        return cell
    }
}
