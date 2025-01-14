//
//  InfoItemViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 01.10.2024.
//

import UIKit
import WebKit

class InfoItemViewController: UIViewController, WKNavigationDelegate {

    //MARK: - Объекты
    var infoItem: String?
    let viewPDF = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViewPDF()
    }
    
    //MARK: - Methods
    
    // создаем область для просмотра pdf и открываем pdf, соответствующий продукту
    func addViewPDF() {
        viewPDF.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        viewPDF.navigationDelegate = self
        if let urlPDFIPhone = Bundle.main.url(forResource: "iPhone", withExtension: "pdf"), infoItem == "IPhone 16 Pro 256 Gb" {
            let iPhoneRequest = URLRequest(url: urlPDFIPhone)
            viewPDF.load(iPhoneRequest)
        } else if let urlPDFIPad = Bundle.main.url(forResource: "iPad", withExtension: "pdf"), infoItem == "IPad Pro 13 1 Tb (M4)" {
            let iPadRequest = URLRequest(url: urlPDFIPad)
            viewPDF.load(iPadRequest)
        } else if let urlPDFAirPods = Bundle.main.url(forResource: "AirPods", withExtension: "pdf"), infoItem == "AirPods Pro 2" {
            let airPodsRequest = URLRequest(url: urlPDFAirPods)
            viewPDF.load(airPodsRequest)
        } else if let urlPDFAppleWatch = Bundle.main.url(forResource: "Apple Watch", withExtension: "pdf"), infoItem == "Apple Watch 10" {
            let appleWatchRequest = URLRequest(url: urlPDFAppleWatch)
            viewPDF.load(appleWatchRequest)
        }
        view.addSubview(viewPDF)
    }
}
