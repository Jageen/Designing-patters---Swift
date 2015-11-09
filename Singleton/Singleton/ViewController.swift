//
//  ViewController.swift
//  Singleton
//
//  Created by Jageen shukla on 09/11/15.
//  Copyright © 2015 Red. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    /**
     For Demo purpose:
     Contain list of object of class AppData
     **/
    var objectArray:NSMutableArray!
    
    /**
     Table view used to display list of AppData classes
     **/
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Allocate memory to object array
        self.objectArray = NSMutableArray()
        
        self.tblView.delegate = self
        self.tblView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objectArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tblView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        let tmpAppData:AppData
        tmpAppData = objectArray[indexPath.row] as! AppData
        
        // --- Little code for prepare cell for demo
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .FullStyle
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let objNumber = String(indexPath.row + 1)
        cell.textLabel?.text = "Object number : " + objNumber
        
        cell.detailTextLabel?.text = "Object created time " + dateFormatter.stringFromDate(tmpAppData.createdTime) + "\nObject used time " + dateFormatter.stringFromDate(tmpAppData.lastReqObject)
        // -----------
        
        return cell
    }

    /**
     Create instance of AppData class then add it into objectArray
     and reload table view
     **/
    @IBAction func btnCreateClicked(sender: AnyObject) {
        let newObj = AppData.sharedInstance();
        objectArray.addObject(newObj);
        self.tblView.reloadData();
    }
}

