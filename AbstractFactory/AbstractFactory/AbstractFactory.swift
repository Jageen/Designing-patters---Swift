//
//  AbstractFactory.swift
//  AbstractFactory
//
//  Create classes for demostrate abstract factory patterns
//  in swift
//
//  Created by Jageen shukla on 12/11/15.
//  Copyright © 2015 Red. All rights reserved.
//

import Foundation

// MARK:- Define protocols
/**
 Represent herbivore
**/
protocol Herbivore
{
    /**
     Return name of herbivore
     **/
    func name()->String
}

/**
 Represent carnivore
 **/
protocol Carnivore
{
    /**
     Return name of carnivore
     **/
    func name()->String
    
    /**
     Define relation ship of herbivore with carnivore
     **/
    func eat(objHerbivore:Herbivore)
}

protocol ContinentFactory
{
    /**
     Create herbivore object
    **/
    func createHerbivore()->Herbivore
    
    /**
     Create carnivore object
     **/
    func createCarnivore()->Carnivore
}

// MARK :- Define classes
/**
Represent wild beast
**/
class Wildebeest:Herbivore
{
    /**
     Return name of herbivore
     **/
    func name()->String
    {
        return "Wildebeest";
    }
}

/**
 Represent Lion
 **/
class Lion: Carnivore {
    func eat(objHerbivore: Herbivore) {
        NSLog("Lion eat %@",objHerbivore.name())
    }
    
    /**
     Return name of carnivore
     **/
    func name()->String
    {
        return "Lion";
    }
}

/**
 Represent Bison
 **/
class Bison:Herbivore
{
    /**
     Return name of herbivore
     **/
    func name()->String
    {
        return "Bison";
    }
}

/**
 Represent Wolf
 **/
class Wolf: Carnivore {
    func eat(objHerbivore: Herbivore) {
        NSLog("Wolf eat %@",objHerbivore.name())
    }
    
    /**
     Return name of carnivore
     **/
    func name()->String
    {
        return "Wolf";
    }
}

class AfricaFactory: ContinentFactory {
    /**
     Create herbivore object
     **/
    func createHerbivore()->Herbivore
    {
        return Wildebeest()
    }
    
    /**
     Create carnivore object
     **/
    func createCarnivore()->Carnivore
    {
        return Lion()
    }
}

class AmericaFactory: ContinentFactory {
    /**
     Create herbivore object
     **/
    func createHerbivore()->Herbivore
    {
        return Bison()
    }
    
    /**
     Create carnivore object
     **/
    func createCarnivore()->Carnivore
    {
        return Wolf()
    }
}

// MARK:- Client class
class AnimalWorld
{
    var _herbivore:Herbivore!
    var _carnivore:Carnivore!
    
    init(objContinent:ContinentFactory)
    {
        self._herbivore = objContinent.createHerbivore()
        self._carnivore = objContinent.createCarnivore()
    }
    
    func runFoodChain()
    {
        _carnivore.eat(_herbivore)
    }
}


