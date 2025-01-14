//
//  OnboardingPageViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 08.10.2024.
//

import UIKit

final class OnboardingPageViewController: UIPageViewController {
    
    
    //MARK: - Objects
    
    private var page1 = FirstViewController()
    private var page2 = SecondViewController()
    private var page3 = ThirdViewController()
    private var pages: [UIViewController] = []
    private let skipButton = UIButton()
    private let nextButton = UIButton()
    private let purchasesButton = UIButton()
    var isLastPage: Bool {
        guard let currentVC = viewControllers?.first, let currentIndex = pages.firstIndex(of: currentVC) else { return false }
        return currentIndex == pages.count - 1
    }
    
    private let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // реализация методов
        setupPageControl()
        addSkipButton()
        addNextButton()
        addPurchasesButton()
    }
    
    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        dataSource = self
        delegate = self
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        setViewControllers([pages[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods
    
    // Настройка кастомного PageControl
    private func setupPageControl() {
        pageControl.frame = CGRect(x: 150, y: 750, width: 120, height: 50)
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .tertiaryLabel
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundColor = .clear
        view.addSubview(pageControl)
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
    }
    
    // Делаем, чтобы при нажатии на элементы PageControl (точки), также менялись контроллеры
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        let currentIndex = sender.currentPage
        let direction: UIPageViewController.NavigationDirection = (currentIndex > pageControl.currentPage) ? .forward : .reverse
        setViewControllers([pages[currentIndex]], direction: direction, animated: true)
        pageControl.currentPage = currentIndex
        lastPageOrNo()
    }
    
    // Добавляем кнопку "Пропустить" для пропуска экранов онбординга и перехода сразу в приложение
    private func addSkipButton() {
        skipButton.frame = CGRect(x: 20, y: 750, width: 150, height: 50)
        skipButton.setTitle("ПРОПУСТИТЬ", for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
        skipButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 14)
        view.addSubview(skipButton)
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
    
    // Функция перехода на tabBarVC (понадобится в коде для кнопки "Пропустить" и "Вперед за покупками" (на последнем экране)
    private func transitionOnTabBarVC() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            guard let window = sceneDelegate.window else { return }
            
            UIView.transition(with: window, duration: 0.5, options: .beginFromCurrentState, animations: {
                sceneDelegate.window?.rootViewController = sceneDelegate.tabBarVC
            }, completion: nil)
            window.makeKeyAndVisible()
        }
    }
    
    // Переходим сразу на tabBarVC, если нажали Пропустить
    @objc private func skipButtonTapped() {
        transitionOnTabBarVC()
    }
    
    // Добавляем кнопку "Дальше" для перехода на следующий экран онбординга
    private func addNextButton() {
        nextButton.frame = CGRect(x: 230, y: 750, width: 150, height: 50)
        nextButton.setTitle("ДАЛЕЕ", for: .normal)
        nextButton.setTitleColor(.systemBlue, for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 14)
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc private func nextButtonTapped() {
        // переходим на следующий контроллер (если он есть)
        guard let currentVC = viewControllers?.first, let currentIndex = pages.firstIndex(of: currentVC), currentIndex < pages.count - 1 else { return }
        let nextVC = pages[currentIndex + 1]
        setViewControllers([nextVC], direction: .forward, animated: true)
        pageControl.currentPage = currentIndex + 1
        lastPageOrNo()
    }
    
    // Создание кнопки "В магазин за покупками" (изначально ее скрываем)
    private func addPurchasesButton() {
        purchasesButton.frame = CGRect(x: 75, y: 740, width: 250, height: 50)
        purchasesButton.setTitle("Вперед за покупками!", for: .normal)
        purchasesButton.setTitleColor(.white, for: .normal)
        purchasesButton.backgroundColor = #colorLiteral(red: 0, green: 0.4972938895, blue: 0.6069428921, alpha: 1)
        purchasesButton.layer.cornerRadius = 12
        purchasesButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 18)
        purchasesButton.isHidden = true
        view.addSubview(purchasesButton)
        purchasesButton.addTarget(self, action: #selector(purchasesButtonTapped), for: .touchUpInside)
    }
    
    @objc private func purchasesButtonTapped() {
        transitionOnTabBarVC()
    }
    
    // Метод, скрывающий или добавляющий кнопки, в зависимости от того, какая страница текущая
    private func lastPageOrNo() {
        if isLastPage {
            skipButton.isHidden = true
            pageControl.isHidden = true
            nextButton.isHidden = true
            purchasesButton.isHidden = false
        } else {
            skipButton.isHidden = false
            pageControl.isHidden = false
            nextButton.isHidden = false
            purchasesButton.isHidden = true
        }
    }
}
    
    //MARK: - UIPageViewControllerDataSource & UIPageViewControllerDelegate
    
    extension OnboardingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        // UIPageViewControllerDataSource -
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
            return pages[index - 1]
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil }
            return pages[index + 1]
        }
        
        // UIPageViewControllerDelegate
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if let visibleViewController = viewControllers?.first, let index = pages.firstIndex(of: visibleViewController) {
                pageControl.currentPage = index
                lastPageOrNo()
            }
        }
    }


    
    

    


