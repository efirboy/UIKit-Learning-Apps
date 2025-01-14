//
//  SecondViewController.swift
//  UISlider (Music Player)
//
//  Created by Alexandr Garkalin on 28.08.2024.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    // данные из первого контроллера
    var imageSecondController = UIImageView()
    var nameSongSecondController: String?
    
    let arrow = UIButton()
    let labelPlaying = UILabel()
    let labelName = UILabel()
    let share = UIButton(type: .system)
    let imageSong = UIImageView()
    let buttonPlus = UIButton()
    let threeDots = UIButton()
    let labelName2 = UILabel()
    let labelSinger = UILabel()
    let slider = UISlider()
    let twoArrow = UIButton()
    let anotherTwoArrow = UIButton()
    let connectButton = UIButton()
    let labelAirPods = UILabel()
    let buttonPlay = UIButton()
    let arrowLeft = UIButton()
    let arrowRight = UIButton()
    let buttonPause = UIButton()
    var startTimeLabel = UILabel()
    var endTimeLabel = UILabel()
    
    let arrowLeftWithAlpha = UIButton()
    let arrowRightWithAlpha = UIButton()
    let volumeSlider = UISlider()
    
    let twoArrowTap = UIButton()
    let anotherTwoArrowTap = UIButton()
    var shuffleFlag = false
    var repeatFlag = false
    
    var player = AVAudioPlayer()
    var timer: Timer?
    var timerStart: Timer?
    var timerEnd: Timer?
    
    let array: Array<Int> = [1, 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default, options: [])
            try audioSession.setActive(true)
        } catch {
            print("Не удалось настроить AVAudioSession")
        }
        
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        
        // Устанавливаем режим отображения, чтобы изображение заполнило весь экран
        backgroundImage.contentMode = .scaleAspectFill
        
        // Добавляем UIImageView как подвид (subview) перед добавлением других view
        self.view.addSubview(backgroundImage)
        
        // Перемещаем backgroundImageView на задний план
        self.view.sendSubviewToBack(backgroundImage)
        
        addArrow()
        addLabelPlaying()
        addLabelNameSong()
        addButtonShare()
        addImageSong()
        addButtonPlus()
        addThreeDots()
        addLabelName2()
        addLabelSinger()
        addSlider()
        addTwoArrow()
        addAnotherTwoArrow()
        addConnectButton()
        addLabelAirPods()
        addButtonPlay()
        if labelName2.text == "Running Up That Hill" {
            addArrowLeftWithAlpha()
        } else {
            addArrowLeft()
        }
        if labelName2.text == "Stranger Things Main Theme" {
            addArrowRightWithAlpha()
        } else {
            addArrowRight()
        }
        addStartTimeLabel()
        addEndTimeLabel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
        player.pause()
        }

    func addArrow() {
        arrow.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
        arrow.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        arrow.tintColor = .black
        arrow.alpha = 0.5
        self.view.addSubview(arrow)
        arrow.addTarget(self, action: #selector(buttonArrowTapped), for: .touchUpInside)
    }
    
    @objc func buttonArrowTapped() {
        dismiss(animated: true)
        player.pause()
    }
    
    func addLabelPlaying() {
        labelPlaying.frame = CGRect(x: 45, y: 15, width: 300, height: 30)
        labelPlaying.text = "Playing from album"
        labelPlaying.textAlignment = .center
        labelPlaying.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelPlaying.textColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(labelPlaying)
    }
    
    func addLabelNameSong() {
        labelName.frame = CGRect(x: 0, y: 35, width: 390, height: 30)
        let subString = nameSongSecondController!.dropLast(4)
        labelName.text = String(subString)
        labelName.textAlignment = .center
        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelName.textColor = .black
        self.view.addSubview(labelName)
    }
    
    func addButtonShare() {
        share.frame = CGRect(x: 340, y: 20, width: 30, height: 30)
        share.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        share.tintColor = .black
        share.alpha = 0.5
        self.view.addSubview(share)
        share.addTarget(self, action: #selector(sharing), for: .touchUpInside)
    }
    
    @objc func sharing() {
        // текст, которым хотим поделиться
        let textToShare = "Поделиться этой песней!"
        // массив объектов для обмена
        let items: [Any] = [textToShare]
        // создаем UIactivityViewController с объектами для обмена
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        // показываем
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func addImageSong() {
        imageSong.frame = CGRect(x: 10, y: 50, width: 350, height: 350)
        imageSong.image = imageSecondController.image
        imageSong.layer.cornerRadius = 18
        imageSong.layer.masksToBounds = true
        let shadowView = UIView(frame: CGRect(x: 10, y: 50, width: 350, height: 350))
        shadowView.backgroundColor = .clear
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 8)
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.9
        self.view.addSubview(shadowView)
        shadowView.addSubview(imageSong)
    }
    
    func addButtonPlus() {
        buttonPlus.frame = CGRect(x: 20, y: 480, width: 40, height: 40)
        buttonPlus.setImage(UIImage(systemName: "plus"), for: .normal)
        buttonPlus.tintColor = .black
        buttonPlus.alpha = 0.5
        self.view.addSubview(buttonPlus)
        buttonPlus.addTarget(self, action: #selector(buttonPlusTapped), for: .touchUpInside)
    }
    
    @objc func buttonPlusTapped() {
        let alert = UIAlertController(title: "К сожалению, добавить новую музыку в плеер невозможно, т.к. я еще не изучил функцию хранения данных", message: "Вы возвращаетесь в плеер", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actionOK)
        present(alert, animated: true)
    }
    
    func addThreeDots() {
        threeDots.frame = CGRect(x: 340, y: 480, width: 40, height: 40)
        threeDots.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        threeDots.tintColor = .black
        threeDots.alpha = 0.5
        self.view.addSubview(threeDots)
        threeDots.addTarget(self, action: #selector(threeDotsTapped), for: .touchUpInside)
    }
    
    @objc func threeDotsTapped() {
        let thirdVC = ThirdViewController()
        thirdVC.image = imageSecondController
        thirdVC.name = labelName2.text
        present(thirdVC, animated: true)
    }
    
    func addLabelName2() {
        labelName2.frame = CGRect(x: 60, y: 485, width: 280, height: 30)
        let subString = nameSongSecondController!.dropLast(4)
        labelName2.text = String(subString)
        labelName2.textAlignment = .center
        labelName2.numberOfLines = 1
        labelName2.font = UIFont.boldSystemFont(ofSize: 20)
        labelName2.textColor = .black
        labelName2.adjustsFontSizeToFitWidth = true
        labelName2.minimumScaleFactor = 0.5
        self.view.addSubview(labelName2)
    }
    
    func addLabelSinger() {
        labelSinger.frame = CGRect(x: 45, y: 515, width: 300, height: 30)
        labelSinger.text = "OST Stanger Things"
        labelSinger.textAlignment = .center
        labelSinger.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelSinger.textColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(labelSinger)
    }
    
    func addSlider() {
        slider.frame = CGRect(x: 30, y: 560, width: 330, height: 30)
        slider.tintColor = UIColor.systemRed.withAlphaComponent(0.8)
        slider.thumbTintColor = UIColor.systemRed.withAlphaComponent(0.8)
        slider.maximumTrackTintColor = UIColor.systemRed.withAlphaComponent(0.3)
        slider.setThumbImage(UIImage(systemName: "circle.fill"), for: .normal)
        slider.setThumbImage(UIImage(systemName: "circle.fill"), for: .highlighted)
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        self.view.addSubview(slider)
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }
    
    @objc func sliderChanged(sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    func addTwoArrow() {
        twoArrow.frame = CGRect(x: 20, y: 620, width: 40, height: 40)
        twoArrow.setImage(UIImage(systemName: "shuffle"), for: .normal)
        twoArrow.tintColor = .black
        twoArrow.alpha = 0.5
        self.view.addSubview(twoArrow)
        twoArrow.addTarget(self, action: #selector(twoArrowTapped), for: .touchUpInside)
    }
    
    @objc func twoArrowTapped() {
        addTwoArrowTap()
        twoArrow.removeFromSuperview()
        shuffleFlag = true
    }
    
    func addAnotherTwoArrow() {
        anotherTwoArrow.frame = CGRect(x: 340, y: 620, width: 40, height: 40)
        anotherTwoArrow.setImage(UIImage(systemName: "repeat"), for: .normal)
        anotherTwoArrow.tintColor = .black
        anotherTwoArrow.alpha = 0.5
        self.view.addSubview(anotherTwoArrow)
        anotherTwoArrow.addTarget(self, action: #selector(anotherTwoArrowTapped), for: .touchUpInside)
    }
    
    @objc func anotherTwoArrowTapped() {
        anotherTwoArrow.removeFromSuperview()
        addAnotherTwoArrowTap()
        repeatFlag = true
    }
    
    func addConnectButton() {
        connectButton.frame = CGRect(x: 180, y: 710, width: 40, height: 40)
        connectButton.setImage(UIImage(systemName: "airplayvideo"), for: .normal)
        connectButton.tintColor = .black
        connectButton.alpha = 0.5
        self.view.addSubview(connectButton)
    }
    
    func addLabelAirPods() {
        labelAirPods.frame = CGRect(x: 50, y: 730, width: 300, height: 30)
        labelAirPods.text = "AirPods available"
        labelAirPods.textAlignment = .center
        labelAirPods.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        labelAirPods.textColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(labelAirPods)
    }
    
    func addButtonPlay() {
        buttonPlay.frame = CGRect(x: 175, y: 620, width: 40, height: 40)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        buttonPlay.setImage(UIImage(systemName: "play.fill", withConfiguration: largeConfig), for: .normal)
        buttonPlay.tintColor = .black
        self.view.addSubview(buttonPlay)
        buttonPlay.addTarget(self, action: #selector(playing), for: .touchUpInside)
    }
    
    @objc func playing() {
        playingSong()
    }
    
    func playingSong() {
        if labelName2.text == "Running Up That Hill" {
            if player.url?.lastPathComponent != "OST1.mp3" {
                do {
                    if let audioPath = Bundle.main.path(forResource: "OST1", ofType: "mp3") {
                        try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    }
                } catch {
                    print("Error")
                }
            }
        }
        
        if labelName2.text == "Stranger Things Main Theme" {
            if player.url?.lastPathComponent != "OST2.mp3" {
                do {
                    if let audioPath = Bundle.main.path(forResource: "OST2", ofType: "mp3") {
                        try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    }
                } catch {
                    print("Error")
                }
            }
        }
        slider.maximumValue = Float(player.duration)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
        player.play()
        addButtonPause()
        buttonPlay.removeFromSuperview()
    }
    
    @objc func updateSlider() {
        slider.value = Float(player.currentTime)
    }
    
    deinit {
        timer?.invalidate()
        timerStart?.invalidate()
        timerEnd?.invalidate()
    }
    
    func addButtonPause() {
        buttonPause.frame = CGRect(x: 175, y: 620, width: 40, height: 40)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        buttonPause.setImage(UIImage(systemName: "pause.fill", withConfiguration: largeConfig), for: .normal)
        buttonPause.tintColor = .black
        self.view.addSubview(buttonPause)
        buttonPause.addTarget(self, action: #selector(pauseTapped), for: .touchUpInside)
    }
    
    @objc func pauseTapped() {
        player.pause()
        addButtonPlay()
        buttonPause.removeFromSuperview()
    }
    
    func addArrowLeftWithAlpha() {
        arrowLeftWithAlpha.frame = CGRect(x: 90, y: 620, width: 40, height: 40)
        let largeSize = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        arrowLeftWithAlpha.setImage(UIImage(systemName: "backward.fill", withConfiguration: largeSize), for: .normal)
        arrowLeftWithAlpha.tintColor = .black
        arrowLeftWithAlpha.alpha = 0.3
        self.view.addSubview(arrowLeftWithAlpha)
    }
    
    func addArrowRightWithAlpha() {
        arrowRightWithAlpha.frame = CGRect(x: 260, y: 620, width: 40, height: 40)
        let largeSize = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        arrowRightWithAlpha.setImage(UIImage(systemName: "forward.fill", withConfiguration: largeSize), for: .normal)
        arrowRightWithAlpha.tintColor = .black
        arrowRightWithAlpha.alpha = 0.3
        self.view.addSubview(arrowRightWithAlpha)
    }
    
    func addArrowLeft() {
        arrowLeft.frame = CGRect(x: 90, y: 620, width: 40, height: 40)
        let largeSize = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        arrowLeft.setImage(UIImage(systemName: "backward.fill", withConfiguration: largeSize), for: .normal)
        arrowLeft.tintColor = .black
        self.view.addSubview(arrowLeft)
        arrowLeft.addTarget(self, action: #selector(arrowLeftTapped), for: .touchUpInside)
    }
    
    @objc func arrowLeftTapped() {
        player.stop()
        arrowRightWithAlpha.removeFromSuperview()
        addArrowRight()
        arrowLeft.removeFromSuperview()
        addArrowLeftWithAlpha()
        if labelName2.text == "Stranger Things Main Theme" {
            imageSong.image = UIImage(named: "ImageSong1")
            labelName.text = "Running Up That Hill"
            labelName2.text = "Running Up That Hill"
            startTimeLabel.text = "00:00"
            endTimeLabel.text = "04:58"
            buttonPause.removeFromSuperview()
            addButtonPlay()
            player.currentTime = 0.0
            playingSong()
            
        }
    }
    
    func addArrowRight() {
        arrowRight.frame = CGRect(x: 260, y: 620, width: 40, height: 40)
        let largeSize = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        arrowRight.setImage(UIImage(systemName: "forward.fill", withConfiguration: largeSize), for: .normal)
        arrowRight.tintColor = .black
        self.view.addSubview(arrowRight)
        arrowRight.addTarget(self, action: #selector(arrowRightTapped), for: .touchUpInside)
    }
    
    @objc func arrowRightTapped() {
        player.stop()
        arrowLeftWithAlpha.removeFromSuperview()
        addArrowLeft()
        arrowRight.removeFromSuperview()
        addArrowRightWithAlpha()
        if labelName2.text == "Running Up That Hill" {
            imageSong.image = UIImage(named: "ImageSong2")
            labelName.text = "Stranger Things Main Theme"
            labelName2.text = "Stranger Things Main Theme"
            startTimeLabel.text = "00:00"
            endTimeLabel.text = "01:30"
            buttonPause.removeFromSuperview()
            addButtonPlay()
            player.currentTime = 0.0
            playingSong()
        }
    }
    
    func addStartTimeLabel() {
        startTimeLabel.frame = CGRect(x: 1, y: 540, width: 95, height: 30)
        startTimeLabel.text = "00:00"
        startTimeLabel.textAlignment = .center
        startTimeLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        startTimeLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(startTimeLabel)
        timerStart = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateStartTimeLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateStartTimeLabel() {
        let minutes = Int(player.currentTime) / 60
        let seconds = Int(player.currentTime) % 60
        startTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    func addEndTimeLabel() {
        endTimeLabel.frame = CGRect(x: 300, y: 540, width: 95, height: 30)
        if labelName2.text == "Running Up That Hill"{
            endTimeLabel.text = "04:58"} else if labelName2.text == "Stranger Things Main Theme" {
                endTimeLabel.text = "01:30"
            }
        endTimeLabel.textAlignment = .center
        endTimeLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        endTimeLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(endTimeLabel)
        timerEnd = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateEndTimerLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateEndTimerLabel() {
        if player.isPlaying{
            let minutes = Int(player.duration - player.currentTime) / 60
            let seconds = Int(player.duration - player.currentTime) % 60
            endTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
        } else {
            if labelName2.text == "Running Up That Hill"{
                endTimeLabel.text = "04:58"} else if labelName2.text == "Stranger Things Main Theme" {
                    endTimeLabel.text = "01:30"
                }
        }
        if endTimeLabel.text == "00:00" && repeatFlag == true {
            player.currentTime = 0
            playingSong()
            
        } else if endTimeLabel.text == "00:00" && shuffleFlag == true {
            let number = array.randomElement()!
            if number == 1 {
                player.stop()
                imageSong.image = UIImage(named: "ImageSong1")
                labelName.text = "Running Up That Hill"
                labelName2.text = "Running Up That Hill"
                startTimeLabel.text = "00:00"
                endTimeLabel.text = "04:58"
                buttonPause.removeFromSuperview()
                addButtonPlay()
                addArrowRight()
                arrowRightWithAlpha.removeFromSuperview()
                arrowLeft.removeFromSuperview()
                addArrowLeftWithAlpha()
                player.currentTime = 0.0
                playingSong()
            } else if number == 2 {
                player.stop()
                imageSong.image = UIImage(named: "ImageSong2")
                labelName.text = "Stranger Things Main Theme"
                labelName2.text = "Stranger Things Main Theme"
                startTimeLabel.text = "00:00"
                endTimeLabel.text = "01:30"
                buttonPause.removeFromSuperview()
                addButtonPlay()
                addArrowLeft()
                arrowLeftWithAlpha.removeFromSuperview()
                arrowRight.removeFromSuperview()
                addArrowRightWithAlpha()
                player.currentTime = 0.0
                playingSong()
                
            }
        } else if endTimeLabel.text == "00:00" && labelName2.text == "Running Up That Hill" {
            addButtonPlay()
            buttonPause.removeFromSuperview()
            arrowRightTapped()
        } else if endTimeLabel.text == "00:00" {
            addButtonPlay()
            buttonPause.removeFromSuperview()
        }
    }
    
    func addAnotherTwoArrowTap() {
        anotherTwoArrowTap.frame = CGRect(x: 340, y: 620, width: 40, height: 40)
        anotherTwoArrowTap.setImage(UIImage(systemName: "repeat.circle.fill"), for: .normal)
        anotherTwoArrowTap.tintColor = .black
        anotherTwoArrowTap.alpha = 0.8
        self.view.addSubview(anotherTwoArrowTap)
        anotherTwoArrowTap.addTarget(self, action: #selector(anotherTwoArrowTapTapped), for: .touchUpInside)
    }
    
    @objc func anotherTwoArrowTapTapped() {
        anotherTwoArrowTap.removeFromSuperview()
        addAnotherTwoArrow()
        repeatFlag = false
    }
    
    func addTwoArrowTap() {
        twoArrowTap.frame = CGRect(x: 20, y: 620, width: 40, height: 40)
        twoArrowTap.setImage(UIImage(systemName: "shuffle.circle.fill"), for: .normal)
        twoArrowTap.tintColor = .black
        twoArrowTap.alpha = 0.5
        self.view.addSubview(twoArrowTap)
        twoArrowTap.addTarget(self, action: #selector(twoArrowTapTapped), for: .touchUpInside)
    }
    
    @objc func twoArrowTapTapped() {
        addTwoArrow()
        twoArrowTap.removeFromSuperview()
        shuffleFlag = false
    }
}
