//
//  ViewController.swift
//  JSONxUITableViewSample
//
//  Created by 前田 晃良 on 2015/10/21.
//  Copyright (c) 2015年 A.M. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.row)番目"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)番目を選択")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

