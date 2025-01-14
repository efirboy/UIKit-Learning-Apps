//
//  LoadViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 07.10.2024.
//

import UIKit

final class LaunchViewController: UIViewController {

    //MARK: - Объекты
    
    private let appleImageView = UIImageView()
    private let startProgressView = UIProgressView()
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // реализация методов
        addAppleImageView()
        addProgressView()
        incrementLoginCount()
    }
    
    //MARK: - Methods
    
    // Добавляем изображение яблока (загрузочное) и скрываем его (альфа = 0)
    private func addAppleImageView() {
        appleImageView.frame = CGRect(x: 160, y: 300, width: 70, height: 70)
        appleImageView.image = UIImage(named: "startApple")
        appleImageView.alpha = 0
        view.addSubview(appleImageView)
    }
    
    // Функция для увеличения количества входов
    private func incrementLoginCount() {
        let currentCount = UserDefaults.standard.integer(forKey: "loginCount")
        let newCount = currentCount + 1
        UserDefaults.standard.set(newCount, forKey: "loginCount")
    }
    
    // Добавляем progressView и запускаем таймер
    private func addProgressView() {
        startProgressView.frame = CGRect(x: 60, y: 540, width: 270, height: 50)
        startProgressView.progress = 0.0
        startProgressView.progressTintColor = .white
        startProgressView.trackTintColor = .black
        view.addSubview(startProgressView)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
    }
    
    // каждую секунду с плавной анимацией обновляем прогресс у startProgressView и добавляем alpha для изображения
    @objc private func updateProgressView() {
        if startProgressView.progress != 1.0 {
            UIView.animate(withDuration: 1.0) {
                self.startProgressView.setProgress(self.startProgressView.progress + 0.1, animated: true)
                self.appleImageView.alpha += 0.1
            }
        } else {
            timer?.invalidate()
            timer = nil
            // переходим на onboardingPageVC или TabBar (созданные в SceneDelegate) (в зависимости от количества входов)
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                guard let window = sceneDelegate.window else { return }
                if UserDefaults.standard.integer(forKey: "loginCount") == 1 {
                    sceneDelegate.window?.rootViewController = sceneDelegate.onboardingPageVC
                } else {
                    sceneDelegate.window?.rootViewController = sceneDelegate.tabBarVC
                }
                window.makeKeyAndVisible()
            }
        }
    }
}
