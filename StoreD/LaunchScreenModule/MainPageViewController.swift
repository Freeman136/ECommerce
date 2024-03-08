import UIKit

class MainPageViewController: UIPageViewController {

    private lazy var abobaPages = createViewControllers()

    override init(transitionStyle _: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        view.backgroundColor = .black
        dataSource = self
        delegate = self
        setViewControllers([abobaPages[0]], direction: .forward, animated: true)
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
        for index in 0..<4 {
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

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = abobaPages.firstIndex(of: (viewController as? RocketViewController)!) else {
            return UIViewController()}

        if currentIndex == 0 {
            return abobaPages.last
        } else {
            return abobaPages[currentIndex - 1]
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = abobaPages.firstIndex(of: (viewController as? RocketViewController)!) else {
            return UIViewController() }

        if currentIndex < abobaPages.count - 1 {
            return abobaPages[currentIndex + 1]  // go next
        } else {
            return abobaPages.first              // wrap to first
        }
    }
}

// MARK: - Delegates

extension MainPageViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int { 4 }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard pageViewController.viewControllers != nil else { return }
    }
}
