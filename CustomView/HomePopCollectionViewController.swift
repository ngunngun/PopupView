//
//  HomePopCollection.swift
//  CustomView
//
//  Created by Lullaby on 5/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

protocol HomePopCollectionViewControllerDelegate {
    func homePopCollectionDidLoad(object:Any?)
}

class HomePopCollectionViewController: UIViewController {
    
    
    @IBOutlet weak var collectionAspectRatio: NSLayoutConstraint!
    
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    var delegate:HomePopCollectionViewControllerDelegate?
    
    var popupArray = [PopObj]()
    
    var cellSize = CGSize.zero //type is CGZero and value equal 0.0
    
    let margin:CGFloat = 10 // cell's margin, will be change soon
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = popupArray.count
        
        self.collectionView.register(UINib(nibName: "CardPopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
        
        self.collectionView.updateLayout() //updated for get the newest frame size
        
        var pageW = self.collectionView.frame.size.width * 0.8
        var pageH = pageW * 1.3
        
        if UIDevice.isIpad() {
            
            self.collectionAspectRatio.priority = 500
            self.collectionHeight.priority = 900
            
            pageW = 500
            
            self.collectionHeight.constant = pageW * 1.4
            
            pageH = self.collectionHeight.constant
            
        }
        
        self.cellSize = CGSize(width: pageW, height: pageH)
        
        self.layout.itemSize = self.cellSize //เหมาะกับที่เป็นแบบเดียวกันหมดทั้งหน้า
        
        self.layout.minimumInteritemSpacing = UIDevice.isIpad() ? margin : 0
        let leftRightMargin = (self.collectionView.frame.size.width - pageW)/2
        
        self.layout.sectionInset = UIEdgeInsetsMake(margin, leftRightMargin, margin, leftRightMargin) // บน ขวา ล่าง ซ้าย
        self.layout.minimumLineSpacing = leftRightMargin*2 //space between cell
        
        self.collectionView.reloadData()
        
        self.delegate?.homePopCollectionDidLoad(object: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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



extension HomePopCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //ไว้ข้างบนก็ได้ แต่แบบนี้เวลาย้าย ย้ายง่ายกว่า
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.popupArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardPopCollectionViewCell
        
        cell.object = self.popupArray[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x < -50 {
            scrollView.contentOffset = CGPoint(x: scrollView.frame.size.width * CGFloat(popupArray.count-1) , y: 0)
        }else if scrollView.contentOffset.x > scrollView.frame.size.width * CGFloat(popupArray.count-1) + 50 {
            scrollView.contentOffset = CGPoint(x:0 , y: 0)
        }
        
    }
    
    
    
    
}
