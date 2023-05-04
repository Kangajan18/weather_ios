//
//  ViewController.swift
//  WeatherApp
//
//  Created by kangajan kuganathan on 2023-05-03.
//

import UIKit

class ViewController: UIViewController, dataOutputs {
    
    //define properties
    var weatherData:WeatherData?
    var weatherModel = WeatherModel()
    
    //define uiElemets
    lazy var searchBar:SearchBarView = {
        let searchBar = SearchBarView()
        searchBar.placeholder = "Enter the City name here"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.sizeToFit()
        return searchBar
    }()
    
    lazy var place:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var celsius:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var celsiusImage:UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    lazy var celsiusStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment  = .center
        stack.distribution = .equalCentering
        stack.addArrangedSubview(celsiusImage)
        stack.addArrangedSubview(celsius)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar
        assignbackground(with: "summer")
        view.backgroundColor = .black
        configure()
        setupUI()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
}

