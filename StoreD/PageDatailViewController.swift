import UIKit

class AllMainPagesViewController: UIViewController {
    private let section = 2
//    private let mainImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "falcon1")
//        return imageView
//    }()

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
        addSubViews()
        setupConstraints()
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
}

extension AllMainPagesViewController {
    // MARK: - addSubViews

    func addSubViews() {
//        view.addSubview(mainImageView)
        view.addSubview(mainCollectionViewScreen)
        mainCollectionViewScreen.translatesAutoresizingMaskIntoConstraints = false
//        mainImageView.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - setupConstraints

    func setupConstraints () {
        NSLayoutConstraint.activate([
            mainCollectionViewScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionViewScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionViewScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCollectionViewScreen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.68),

//            mainImageView.topAnchor.constraint(equalTo: view.topAnchor),
//            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AllMainPagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        section
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopUIHorizontalCell", for: indexPath) as? TopUIHorizontalCell {
            cell.textLabel.text = "1231das lajflskj"
            return cell
        }
        return UICollectionViewCell()
    }
}
