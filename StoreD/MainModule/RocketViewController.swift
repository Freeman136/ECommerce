import UIKit

protocol RocketViewControllerDelegate: AnyObject {
    func updateStruct(models: [RocketDTO])
}

class RocketViewController: UIViewController {
    var rocketDTOs: [RocketDTO] = []

    var presenter = RocketPresenter()

    private let mainCollectionViewScreen: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        presenter.loadView()
        updateStruct(models: rocketDTOs)
        mainCollectionViewScreen.delegate = self
        mainCollectionViewScreen.dataSource = self
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
            mainCollectionViewScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionViewScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCollectionViewScreen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.68)
        ])
    }
}

extension RocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopUIHorizontalCell", for: indexPath) as? TopUIHorizontalCell else {
            return UICollectionViewCell()
        }
        print(rocketDTOs.count)
        let rocket = rocketDTOs[indexPath.item]
        cell.configureCell(with: "Text \(rocket.country)")
        return cell
    }
}
// MARK: - CGSize(width: 100, height: 100)
extension RocketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension RocketViewController: RocketViewControllerDelegate {

    func updateStruct(models: [RocketDTO]) {
        rocketDTOs = models
        mainCollectionViewScreen.reloadData()
    }
}
