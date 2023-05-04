//
//  SearchBarView.swift
//  WeatherApp
//
//  Created by kangajan kuganathan on 2023-05-03.
//

import UIKit

class SearchBarView: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
        layer.cornerRadius = 10
    }
}
