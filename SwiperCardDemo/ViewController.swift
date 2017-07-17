//
//  ViewController.swift
//  SwiperCardDemo
//
//  Created by APPLE MAC MINI on 11/07/17.
//  Copyright © 2017 APPLE MAC MINI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
   
    @IBOutlet weak var Card: UIView!
    
    
    
    
  
    @IBOutlet weak var selectImgView: UIImageView!

    
    var divisor:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        divisor = (view.frame.width/2) / 0.61
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btndisselect(_ sender: UIButton) {
        
    }
    @IBAction func btnselect(_ sender: UIButton) {
    }
    
   
    @IBAction func cardMove1(_ sender: UIPanGestureRecognizer) {
        
        let card = sender.view!
        
        let point = sender.translation(in: view)
        
        let xfromCenter = card.center.x - view.center.x
        
        let scale = min(100/abs(xfromCenter) , 1);
        
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y+point.y)
        
        
        card.transform = CGAffineTransform(rotationAngle: xfromCenter/divisor).scaledBy(x: scale, y: scale)
        
        
        if (sender.state == UIGestureRecognizerState.ended)
        {
            
            if(card.center.x < 75)
            {
                //move the card off on left side...
                
                 UIView.animate(withDuration: 0.3, animations: {
                
                    card.center = CGPoint(x: card.center.x - 300 , y: card.center.y + 100)
                    
                
                })
                
                return
                //here return is written so the the code below the if and else if doesnot call
            }
            else if(card.center.x > view.frame.width - 75) {
                //move off the card in right side...
                
                UIView.animate(withDuration: 0.3, animations: {
                
                
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y + 100)
                })
                
                return
                
            }
            
            resetCardpositon()
            
            //this method is called to reset the position of card to normal...
            
        }
        
        
        
        /*
         //this is the code for showing the like and dislike images on the card itself....
        
        if(xfromCenter > 0){
            
            selectImgView.image = #imageLiteral(resourceName: "like")
            selectImgView.tintColor = UIColor.green
            
        }
        else{
        
            selectImgView.image = #imageLiteral(resourceName: "dislike")
            selectImgView.tintColor = UIColor.red
            
        }
         
         */
        
        //selectImgView.alpha = abs(xfromCenter) / view.center.x
    }
    
    
    @IBAction func resetCard(_ sender: UIButton) {
        
        resetCardpositon()
    }
    
    
    func resetCardpositon()
    {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.Card.center = self.view.center
            
            self.Card.transform = CGAffineTransform.identity
            
            //self.selectImgView.alpha = 0
        })

    }
    
}

