//
//  ViewController.swift
//  Auto Layout (myApp)
//
//  Created by Alexandr Garkalin on 14.10.2024.
//

import UIKit

final class ViewController: UIViewController {

    private let trafficLightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    } ()
    
    private let redTrafficLightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    } ()
    
    private let yellowTrafficLightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    } ()
    
    private let greenTrafficLightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(trafficLightView)
        view.addSubview(redTrafficLightView)
        view.addSubview(yellowTrafficLightView)
        view.addSubview(greenTrafficLightView)
        
        createConstraintsForTrafficView()
        view.layoutIfNeeded()
        createConstraintForRedView()
        createConstraintForYellowView()
        createConstraintForGreenView()
    }
    
    // после компоновки всех дочерних вью, закругляем круги у сигналов (цветов) светофора
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redTrafficLightView.layer.cornerRadius = redTrafficLightView.bounds.height / 2
        yellowTrafficLightView.layer.cornerRadius = yellowTrafficLightView.bounds.height / 2
        greenTrafficLightView.layer.cornerRadius = greenTrafficLightView.bounds.height / 2
    }
    
    private func createConstraintsForTrafficView() {
        trafficLightView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        trafficLightView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        trafficLightView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2.5).isActive = true
        trafficLightView.widthAnchor.constraint(equalToConstant: view.bounds.width / 3).isActive = true
    }
    
    private func createConstraintForRedView() {
        redTrafficLightView.topAnchor.constraint(equalTo: trafficLightView.topAnchor, constant: trafficLightView.bounds.height * 0.05).isActive = true
        redTrafficLightView.centerXAnchor.constraint(equalTo: trafficLightView.centerXAnchor).isActive = true
        redTrafficLightView.heightAnchor.constraint(equalTo: trafficLightView.heightAnchor, multiplier: 0.23, constant: 0).isActive = true
        redTrafficLightView.widthAnchor.constraint(equalTo: redTrafficLightView.heightAnchor).isActive = true
    }
    
    private func createConstraintForYellowView() {
        yellowTrafficLightView.topAnchor.constraint(equalTo: trafficLightView.topAnchor, constant: trafficLightView.bounds.height * 0.36).isActive = true
        yellowTrafficLightView.centerXAnchor.constraint(equalTo: trafficLightView.centerXAnchor).isActive = true
        yellowTrafficLightView.heightAnchor.constraint(equalTo: trafficLightView.heightAnchor, multiplier: 0.23, constant: 0).isActive = true
        yellowTrafficLightView.widthAnchor.constraint(equalTo: yellowTrafficLightView.heightAnchor).isActive = true
    }
    
    private func createConstraintForGreenView() {
        greenTrafficLightView.topAnchor.constraint(equalTo: trafficLightView.topAnchor, constant: trafficLightView.bounds.height * 0.66).isActive = true
        greenTrafficLightView.centerXAnchor.constraint(equalTo: trafficLightView.centerXAnchor).isActive = true
        greenTrafficLightView.heightAnchor.constraint(equalTo: trafficLightView.heightAnchor, multiplier: 0.23, constant: 0).isActive = true
        greenTrafficLightView.widthAnchor.constraint(equalTo: greenTrafficLightView.heightAnchor).isActive = true
    }
}

