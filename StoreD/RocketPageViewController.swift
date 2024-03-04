import UIKit

class RocketPageViewController: UIPageViewController {

    private let pages: [UIViewController] = [
        RocketViewControllerAll.init(index: 0),
        RocketViewControllerAll.init(index: 1),
        RocketViewControllerAll.init(index: 2),
        RocketViewControllerAll.init(index: 3)
    ]

    override init(transitionStyle _: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        view.backgroundColor = .black
        dataSource = self
        delegate = self
        setViewControllers([pages[0]], direction: .forward, animated: true)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - DataSources

extension RocketPageViewController: UIPageViewControllerDataSource {

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

extension RocketPageViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int { 4 }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard pageViewController.viewControllers != nil else { return }
    }
}
