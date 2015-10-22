//
//  SecondViewController.swift
//  JSONxUITableViewSample
//
//  Created by 前田 晃良 on 2015/10/22.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var memberDictionary:NSDictionary = [:]
    var nameString:String = ""
    
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberSeries: UILabel!
    @IBOutlet weak var memberBirth: UILabel!
    @IBOutlet weak var memberGame: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        memberName.text = nameString //選択したキャラクター名
        
        var birthInt:Int = memberDictionary["birth"] as! Int //birthキー
        memberBirth.text = "\(birthInt)年"
        
        memberSeries.text = memberDictionary["タイトル"] as? String //タイトルキー
        
        memberGame.text = memberDictionary["ジャンル"] as? String //ジャンルキー

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
