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
    var selectedName:String = ""
    
    var dictKeys = [] //すべてのキー
    var dictValues = [] //すべての値
    
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
        
        //辞書データのキーのみをすべて取得する
        dictKeys = memberDictionary.allKeys
        println(dictKeys[0])
        
        //辞書データの値のみをすべて取得する
        dictValues = memberDictionary.allValues
        println(dictValues[0])
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
        
        selectedName = memberArray[indexPath.row] as! String
        println(memberDictionary[selectedName])
        
        performSegueWithIdentifier("segue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "segue"){
            var secondViewController = segue.destinationViewController as! SecondViewController
            secondViewController.memberDictionary = memberDictionary[selectedName] as! NSDictionary
            secondViewController.nameString = selectedName
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

