//
//  ViewController+Extentions.swift
//  WeatherApp
//
//  Created by kangajan kuganathan on 2023-05-04.
//

import UIKit

//MARK: - configure
extension ViewController {
    func configure() {
        searchBar.delegate = self
        weatherModel.delegate = self
    }
    
    func loadedData(data: WeatherData) {
        weatherData = data
        place.text = weatherData?.name
        celsius.text = "\(String(format: "%.1f",(weatherData?.main.temp)!)) ºC"
        if let iconString = weatherData?.weather[0].main.lowercased(){
            celsiusImage.image = UIImage(imageLiteralResourceName: iconString)
        }
    }
}

//MARK: - searchBar delegate
extension ViewController:UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //want to call weatherModel
        if let cityName = searchBar.text {
            weatherModel.fetchData(cityName: cityName)
            searchBar.resignFirstResponder()
        }
    }
}

//MARK: - uiElement Autolayout
extension ViewController {
    func setupUI() {
        view.addSubview(place)
        view.addSubview(celsiusStack)
    
        NSLayoutConstraint.activate([
            place.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -20),
            place.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            place.heightAnchor.constraint(equalToConstant: 60),
            
            celsiusStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            celsiusStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -20),
            celsiusStack.topAnchor.constraint(equalTo: place.bottomAnchor,constant: 30),
            celsiusStack.heightAnchor.constraint(equalToConstant: 100),
            
        ])
        
        
    }
    func assignbackground(with image:String){
        let background = UIImage(named: image)
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        imageView.alpha = 0.6
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}
