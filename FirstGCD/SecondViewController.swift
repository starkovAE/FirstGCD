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
        delay(3) {
            self.loginAlert()
        }
     
    }
    private func loginAlert() {
        let alC = UIAlertController(title: "Зарегистрированы?", message: "Введите ваш логин и пароль", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alC.addAction(okAction)
        alC.addAction(cancelAction)
        
        alC.addTextField { usernameTF in
            usernameTF.placeholder = "Введите логин"
        }
        alC.addTextField { userPasswordTF in
            userPasswordTF.placeholder = "Введите пароль"
        }
        self.present(alC, animated: true, completion: nil)
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    
    private func fetchImage() {
        imageURL = URL(string: "https://www.bmw.ru/content/dam/bmw/marketRU/bmw_ru/images/m2_coupe_1680.jpg/jcr:content/renditions/cq5dam.resized.img.1680.large.time1524218791307.jpg")
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        let queaue = DispatchQueue.global(qos: .utility) //отличный поток от main (полезный)
        queaue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)//срабатывает в основном потоке
            }
           
        }
       
    }

}
