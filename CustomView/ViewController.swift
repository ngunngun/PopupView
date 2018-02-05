//
//  ViewController.swift
//  CustomView
//
//  Created by Lullaby on 1/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

struct PopObj {
    var img = ""
    var title = ""
    var desc = ""
}

class ViewController: UIViewController {

    var popupArray = [
        PopObj(img: "http://anguerde.com/pics/main/52/393978-view.jpg", title: "Stay motivated while taking unlimited fitness classes with GuavaPass. Sign up now!",
               desc: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor."),
        
        PopObj(img: "http://i.dailymail.co.uk/i/pix/2017/04/11/06/3F23D80300000578-4399486-Palace_of_Westminster_view_from_the_Westminster_Bridge_One_of_th-a-12_1491890238800.jpg", title: "2Stay motivated while taking unlimited fitness classes with GuavaPass. Sign up now!",
               desc: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor."),
        
        PopObj(img: "http://canacopegdl.com/images/view/view-4.jpg", title: "3Stay motivated while taking unlimited fitness classes with GuavaPass. Sign up now!",
               desc: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier:
            "openPop", sender: nil)
        /*
        if let vc = UIStoryboard(name:"HomePopup", bundle: nil).instantiateViewController(withIdentifier: "HomePopViewController") as? HomePopViewController {
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
            
        }
        */
    }
    
    //พอ performSegue ถูกเรียก อันนี้ก็ทำ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "openPop" {
            if let vc = segue.destination as? HomePopViewController {
                vc.popupArray = self.popupArray
                vc.delegate = self
            }
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

extension ViewController: HomePopViewControllerDelegate {
    func homePopDidLoad(object: Any?) {
        if let isLoaded = object as? Bool {
            print("isLoaded: \(isLoaded)")
        }
    }
    
    
}
