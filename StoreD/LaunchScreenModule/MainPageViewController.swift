import UIKit

class MainPageViewController: UIPageViewController {

    private let pages: [UIViewController] = [
        RocketViewController.init(index: 0),
        RocketViewController.init(index: 1),
        RocketViewController.init(index: 2),
        RocketViewController.init(index: 3)
    ]

    private lazy var abobaPages = createViewControllers()

    override init(transitionStyle _: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        view.backgroundColor = .black
        dataSource = self
        delegate = self
        setViewControllers([pages[0]], direction: .forward, animated: true)
        parseAllData()
    }

    func parseAllData() {
        // let structs = await networkManager.ParsData()
//        abobaPages.forEach { viewController in
//            viewController.presenter?.updateData(model: <#RocketDTO#>)
//        }
    }

    func createViewControllers() -> [RocketViewController] {
        var array = [RocketViewController]()
        for index in 0..<3 {
            let viewController = RocketViewController(index: index)
            let presenter = RocketPresenter()
            presenter.view = viewController
            viewController.presenter = presenter
            array.append(viewController)
        }
        return array
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DataSources

extension MainPageViewController: UIPageViewControllerDataSource {

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

extension MainPageViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int { 4 }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard pageViewController.viewControllers != nil else { return }
    }
}
