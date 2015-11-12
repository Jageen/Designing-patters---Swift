//
//  Sort.swift
//  Strategy
//
//  Contain classes and protocols for demostrate stretergy patterns
//  Created by Jageen shukla on 12/11/15.
//  Copyright © 2015 Red. All rights reserved.
//

import Foundation

/**
 Define protocol for each sort strategy must have
**/
protocol sortStrategy
{
    func sort(list:NSArray)
}

/**
 Perform sort using quick sort algorithm
**/
class quickSort: sortStrategy {
    func sort(list:NSArray) {
        NSLog("Sort using quick sort algorithm")
    }
}

/**
 Perform sort using bouble sort algorithm
 **/
class boubleSort: sortStrategy {
    func sort(list:NSArray) {
         NSLog("Sort using bouble sort algorithm")
    }
}

class SortList {
    /**
     Contain list of object which will going to sort
     **/
    var list:NSMutableArray!
    
    /**
     Hold reference of stratefy used to sort the list
     **/
    var objSortStrategy:sortStrategy!
    
    init()
    {
        self.list = NSMutableArray()
    }
    
    /**
     Set strategy patterns for sort
     **/
    func setSortStrategy(stratergy:sortStrategy)
    {
        self.objSortStrategy = stratergy
    }
    
    /**
     Sort list using selected strategy
     **/
    func sort()
    {
        self.objSortStrategy.sort(self.list);
    }
}