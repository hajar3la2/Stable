//
//  DataController.swift
//  Stable Watch App
//
//  Created by Hajar on 1/9/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "StableModel")
    
    init() { //load data (all what is needed)
        container.loadPersistentStores{
            desc, error in //description and error
            if let error = error {
                print("there is an error in init of DataController class: \(error.localizedDescription)")
            }
        }
    }
   
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("data saved")
        }
        catch{
            print("error in save function of DataController class")
        }
    }
    
    
    func addMeasurement(amount:Int, context:NSManagedObjectContext){
        let measurement = Content(context: context)
        measurement.id = UUID()
        measurement.date = Date()
        measurement.measurement = Int64(amount)
        
        save(context: context)
    }
    
    
    func editMeasurement(measurement:Content, amount:Int, context:NSManagedObjectContext){
        measurement.date = Date()
        measurement.measurement = Int64(amount)
        
        save(context: context)
    }
}
