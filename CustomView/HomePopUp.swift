//
//  Home_popup.swift
//  CustomView
//
//  Created by Lullaby on 1/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

class HomePopUp: UIView {
    
    var object:PopObj? {
        didSet {
            if let popObj = self.object {
                self.downloadImage(url: URL(string: popObj.img)!)
                self.titleLabel.text = popObj.title
                self.descLabel.text = popObj.desc
            }
        }
    }
    

    var view: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var readMoreButton: UIButton!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    @IBAction func readMoreButtonPressed(_ sender: UIButton) {
    }
    
    
    class func instanceFromNib() -> HomePopUp {
        return Bundle.main.loadNibNamed("HomePopUp", owner: nil, options: nil)![0] as! HomePopUp
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
}
