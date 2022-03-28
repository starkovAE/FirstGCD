//
//  SecondViewController.swift
//  FirstGCD
//
//  Created by Александр Старков on 28.03.2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImage()
    }
    
    private func fetchImage() {
        imageURL = URL(string: "https://www.bmw.ru/content/dam/bmw/marketRU/bmw_ru/images/m2_coupe_1680.jpg/jcr:content/renditions/cq5dam.resized.img.1680.large.time1524218791307.jpg")
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }

}
