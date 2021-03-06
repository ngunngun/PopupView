//
//  HomePopViewController.swift
//  CustomView
//
//  Created by Lullaby on 2/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

protocol HomePopViewControllerDelegate {
    func homePopDidLoad(object:Any?)
}

class HomePopViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollViewAspectRatio: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var delegate:HomePopViewControllerDelegate?
    
    var popupArray = [PopObj]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = popupArray.count
        
        scrollView.delegate = self

        view.isOpaque = false
        definesPresentationContext = true
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        self.scrollView.updateLayout() //from extension, update to show correct layout
        self.scrollView.isPagingEnabled = true
        
        var pageX:CGFloat = 0
        var pageW = self.scrollView.frame.size.width
        var pageH = self.scrollView.frame.size.height
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            //if in iPad
            self.scrollViewAspectRatio.priority = 500
            self.scrollViewHeight.priority = 900
            
            pageW = 500 //because we want to make view size to be 500 in iPad
            pageX = (self.scrollView.frame.size.width - pageW)/2
            
            self.scrollViewHeight.constant = pageW * 1.3
            pageH = self.scrollViewHeight.constant //because we updated the constant of height, so we have to update pageH too.
            
            self.scrollView.updateLayout()
        }
        
        for i in 0..<self.popupArray.count {
            //popup view
            let popupFrame : CGRect = CGRect(x:pageX, y:0, width: pageW ,height:pageH) //the reason why we have to updated pageH because we use it here.
            let popupView = HomePopUp.instanceFromNib()
            popupView.frame = popupFrame
            popupView.object = self.popupArray[i]
            self.scrollView.addSubview(popupView)
            pageX += self.scrollView.frame.size.width
        
            
        }
        self.scrollView.contentSize = CGSize(width: pageX, height: pageH)

        
        // Do any additional setup after loading the view.
        self.delegate?.homePopDidLoad(object: true)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        //Not any becuase it a button, it dont have many type of object
        self.dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageW = self.scrollView.frame.size.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(pageW))
        
        if self.scrollView.contentOffset.x < -40 {
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.frame.size.width * CGFloat(popupArray.count-1) , y: 0)
        }else if self.scrollView.contentOffset.x > self.scrollView.frame.size.width * CGFloat(popupArray.count-1) + 40 {
            self.scrollView.contentOffset = CGPoint(x:0 , y: 0)
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
