//
//  WebInfoItemController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 30.09.2024.
//

import UIKit
import WebKit

class WebInfoItemController: UIViewController, WKNavigationDelegate {

    //MARK: - Объекты
    var infoItem: String?
    let webView = WKWebView()
    let indicatorLoad = UIActivityIndicatorView()
    let webToolBar = UIToolbar()
    var backItem = UIBarButtonItem()
    var fixedSpace = UIBarButtonItem()
    var forwardItem = UIBarButtonItem()
    var refreshItem = UIBarButtonItem()
    var flexibleSpace = UIBarButtonItem()
    var shareItem = UIBarButtonItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addWebView()
        addIndicatorLoad()
        addWebToolBar()
        addItemsForToolbar()
    }
    
    //MARK: - Methods
    
    // Добавляем мини-браузер и настраиваем ссылки для перехода
    func addWebView() {
        webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        webView.navigationDelegate = self
        if let iPhoneURL = URL(string: "https://www.apple.com/iphone-16-pro/"),
        let iPadURL = URL(string: "https://www.apple.com/ipad-pro/"),
        let airPodsURL = URL(string: "https://www.apple.com/airpods-pro/"),
        let appleWatchURL = URL(string: "https://www.apple.com/apple-watch-series-10/"),
        let appleURL = URL(string: "https://www.apple.com")
        {
            let iPhoneRequest = URLRequest(url: iPhoneURL)
            let iPadRequest = URLRequest(url: iPadURL)
            let airPodsRequest = URLRequest(url: airPodsURL)
            let appleWatchRequest = URLRequest(url: appleWatchURL)
            let appleRequest = URLRequest(url: appleURL)
            
            switch infoItem {
            case "IPhone 16 Pro 256 Gb": webView.load(iPhoneRequest)
            case "IPad Pro 13 1 Tb (M4)": webView.load(iPadRequest)
            case "AirPods Pro 2": webView.load(airPodsRequest)
            case "Apple Watch 10": webView.load(appleWatchRequest)
            default: webView.load(appleRequest)
            }
        }
        view.addSubview(webView)
    }
    
    // Добавляем индикатор загрузки
    func addIndicatorLoad() {
        indicatorLoad.center = view.center
        indicatorLoad.hidesWhenStopped = true
        view.addSubview(indicatorLoad)
    }
    
    // Добавляем toolBar
    func addWebToolBar() {
        webToolBar.frame = CGRect(x: 0, y: 700, width: view.bounds.width, height: 50)
        webToolBar.backgroundColor = .systemGray6
        view.addSubview(webToolBar)
    }
    
    // Добавляем кнопки в toolBar
    func addItemsForToolbar() {
        backItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backItemTapped))
        fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 20
        forwardItem = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(forwardItemTapped))
        flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        shareItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareItemTapped))
        refreshItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshItemTapped))
        webToolBar.items = [backItem, fixedSpace, forwardItem, flexibleSpace, shareItem, fixedSpace, refreshItem]
        
    }
    
    // нажатие на кнопку назад
    @objc func backItemTapped() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    // нажатие на кнопку вперед
    @objc func forwardItemTapped() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    // нажатие на кнопку перезагрузки
    @objc func refreshItemTapped() {
        webView.reload()
    }

    // нажатие на кнопку поделиться
    @objc func shareItemTapped() {
        var shareURL = URL(string: "")
        switch infoItem {
        case "IPhone 16 Pro 256 Gb": shareURL = URL(string: "https://www.apple.com/iphone-16-pro/")
        case "IPad Pro 13 1 Tb (M4)": shareURL = URL(string: "https://www.apple.com/ipad-pro/")
        case "AirPods Pro 2": shareURL = URL(string: "https://www.apple.com/airpods-pro/")
        case "Apple Watch 10": shareURL = URL(string: "https://www.apple.com/apple-watch-series-10/")
        default: shareURL = URL(string: "https://www.apple.com/")
        }
        let activity = UIActivityViewController(activityItems: [shareURL!], applicationActivities: nil)
        present(activity, animated: true)
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // начало загрузки
        indicatorLoad.startAnimating()
        backItem.isEnabled = false
        forwardItem.isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // конец загрузки
        indicatorLoad.stopAnimating()
        if webView.canGoBack {
            backItem.isEnabled = true
        } else if webView.canGoForward {
            forwardItem.isEnabled = true
        }
    }
}
