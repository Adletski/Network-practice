//
//  WebViewController.swift
//  Networking
//
//  Created by Adlet Zhantassov on 25.03.2023.
//

import WebKit
import SnapKit

class WebViewController: UIViewController {
    
    private lazy var customWebView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    var url: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        loadWeb()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(customWebView)
    }
    
    private func setupConstraints() {
        customWebView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func loadWeb() {
        guard let url = url else { return }
        customWebView.load(URLRequest(url: URL(string: url)!))
    }
}
