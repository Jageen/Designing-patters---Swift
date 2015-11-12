//
//  ViewController.swift
//  AbstractFactory
//
//  Created by Jageen shukla on 12/11/15.
//  Copyright © 2015 Red. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let africa:ContinentFactory = AfricaFactory()
        
        var world:AnimalWorld = AnimalWorld(objContinent: africa)
        world.runFoodChain()
        
        let america:ContinentFactory = AmericaFactory()
        
        world = AnimalWorld(objContinent: america)
        world.runFoodChain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

