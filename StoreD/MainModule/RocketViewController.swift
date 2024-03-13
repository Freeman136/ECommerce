import UIKit

protocol RocketViewControllerDelegate: AnyObject {
    func updateStruct(model: RocketDTO)
}

class RocketViewController: UIViewController {
    var presenter: RocketPresenter?
    var rockets: RocketDTO?

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
        mainCollectionInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func mainCollectionInit() {
        let layout = UICollectionViewCompositionalLayout { sectionNumber, _ -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
    //            item.contentInsets.trailing = 16
    //            item.contentInsets.bottom = 16
                let groupSize = NSCollectionLayoutSize(widthDimension:
                        .fractionalWidth(0.289),
                heightDimension: .absolute(120))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                section.orthogonalScrollingBehavior = .continuous

                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(333), heightDimension: .absolute(120)))
                item.contentInsets.leading = 16
                item.contentInsets.trailing = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(33)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: "Falcon", alignment: .topLeading)
                ]
                return section
            }
        }

         let mainCollectionViewScreen: UICollectionView = {
            let mainCollectionViewScreen = UICollectionView(frame: .zero, collectionViewLayout: layout)
            mainCollectionViewScreen.translatesAutoresizingMaskIntoConstraints = false
            mainCollectionViewScreen.backgroundColor = UIColor.black
            mainCollectionViewScreen.layer.cornerRadius = 35
            mainCollectionViewScreen.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            mainCollectionViewScreen.clipsToBounds = true
            mainCollectionViewScreen.collectionViewLayout = layout
            mainCollectionViewScreen.showsHorizontalScrollIndicator = false

            mainCollectionViewScreen.register(TopUIHorizontalCell.self,
                                              forCellWithReuseIdentifier: "TopUIHorizontalCell")
             mainCollectionViewScreen.register(MenuHorizontalCell.self,
                                               forCellWithReuseIdentifier: "MenuHorizontalCell")

            mainCollectionViewScreen.delegate = self
            mainCollectionViewScreen.dataSource = self

            return mainCollectionViewScreen
        }()
        view.addSubview(mainCollectionViewScreen)

        NSLayoutConstraint.activate([
            mainCollectionViewScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionViewScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionViewScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCollectionViewScreen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.68)
        ])
    }
}

extension RocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < 4 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopUIHorizontalCell",
                                                                for: indexPath) as? TopUIHorizontalCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(withMainText: "Main Text", secondText: "second text")
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuHorizontalCell",
                                                                for: indexPath) as? MenuHorizontalCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(withMainText: "Первый запуск", secondText: "7 февраля 2018")
            return cell
        }
    }
}
// MARK: - CGSize(width: 100, height: 100)
extension RocketViewController: UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        return 9
    }
}

extension RocketViewController: RocketViewControllerDelegate {
    func updateStruct(model: RocketDTO) {
        rockets = model
        print("\(model.name)")
    }
}
