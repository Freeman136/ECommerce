import UIKit

class RocketViewController: UIPageViewController {

    var pages = [UIViewController]()
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
        setupConstraints()
    }
}

// MARK: - setup
extension RocketViewController {

    func setupMainViewImage() {
    }

    func setup() {
        for controller in 0...3 {
            pages.append(AllMainPagesViewController.init(index: controller))
        }

        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
    }
// MARK: - layout NSLayoutConstraint

        func setupConstraints () {
//            view.addSubview(someView)
//            NSLayoutConstraint.activate([
//                someView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//                someView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                someView.widthAnchor.constraint(equalToConstant: 100),
//                someView.heightAnchor.constraint(equalToConstant: 100)
//            ])
        }

}

// MARK: - DataSources

extension RocketViewController: UIPageViewControllerDataSource {

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

extension RocketViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int { 4 }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard pageViewController.viewControllers != nil else { return }
    }
}
