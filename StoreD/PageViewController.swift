import UIKit

class ViewController: UIPageViewController {
    let mainScreenCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.collectionView?.layer.cornerRadius = 25
        let mainScreenCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        mainScreenCollectionView.layer.cornerRadius = 10
        mainScreenCollectionView.layer.masksToBounds = true
        mainScreenCollectionView.backgroundColor = UIColor.darkGray

        return mainScreenCollectionView
    }()

    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0

    override init(transitionStyle _: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey: Any]? = nil) {
            super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
            view.backgroundColor = .black
            dataSource = self
            delegate = self
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
}

extension ViewController {

    private func viewController(for index: Int) -> UIViewController {
        let viewController = UIViewController()
        var background: UIColor = .black

        switch index {
        case 0:
            background = .red
        case 1:
            background = .systemIndigo
        case 2:
            background = .green
        case 3:
            background = .lightGray
        default:
            background = .systemGroupedBackground
        }

        viewController.view.backgroundColor = background
        return viewController
    }
}

// MARK: - Actions

extension ViewController {
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    // MARK: - setup
    func setup() {
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)

        for controller in 0...3 {
            pages.append(viewController(for: controller))
        }

        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }

    func setupCollectionViewCorners() {

    }
// MARK: - style

    func style() {
        mainScreenCollectionView.translatesAutoresizingMaskIntoConstraints = false

        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    // MARK: - layout NSLayoutConstraint

    func layout() {
        view.addSubview(pageControl)
        view.addSubview(mainScreenCollectionView)

        NSLayoutConstraint.activate([
            mainScreenCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScreenCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScreenCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScreenCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScreenCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),

            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
        ])
    }

}

// MARK: - DataSources

extension ViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap to first
        }
    }
}

// MARK: - Delegates

extension ViewController: UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
    }
}
