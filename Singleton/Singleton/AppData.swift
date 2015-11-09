//
//  AppData.swift
//  Singleton
//
//  Created by Jageen shukla on 09/11/15.
//  Copyright © 2015 Red. All rights reserved.
//

/**
AppData responsible for storing app data
**/
import Foundation

class AppData
{
    // Create static variable so that for all object share
    // same memory for this variable
    static var instance:AppData!
    
    /**
     For Demo purpose:
     Store object created time
     **/
    var createdTime:NSDate!
    
    /**
     For Demo purpose:
     Store time for last request for create
     object
     **/
    var lastReqObject:NSDate!
    
    /**
     function which return shared instance of class
     it will first check that is instance is created if not then
     create and then return else return withought allocating new
     memory
     **/
    class func sharedInstance()->AppData {
        if(self.instance == nil)
        {
            self.instance = AppData()
            
            // Set object created time
            self.instance.createdTime = NSDate()
        }
        
        // Set time for last request for create
        self.instance.lastReqObject = NSDate()
        return self.instance;
    }
}