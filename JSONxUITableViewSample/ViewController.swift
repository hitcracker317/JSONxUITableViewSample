//
//  ViewController.swift
//  JSONxUITableViewSample
//
//  Created by 前田 晃良 on 2015/10/21.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var memberArray:NSMutableArray = []
    var memberDictionary:NSDictionary = [:]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //プロジェクト内のJSONファイルを取得
        var path = NSBundle.mainBundle().pathForResource("nintendoJSON", ofType: "json")
        var jsonData = NSData(contentsOfFile:path!)
        
        memberDictionary = NSJSONSerialization.JSONObjectWithData(jsonData!, options: nil, error: nil) as! NSDictionary
        
        for (key,dictionary) in memberDictionary{
            memberArray.addObject(key) //キーを格納
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        
        var text = memberArray[indexPath.row] as! String
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)番目を選択")
        
        var memberName = memberArray[indexPath.row] as! String
        println(memberDictionary[memberName])
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

