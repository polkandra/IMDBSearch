//
//  CoreDataTableView.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 31.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataTableView: UITableViewController {
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Film> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Film> = Film.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"name", ascending: true)]
        
        // Create Fetched Results Controller
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
}

// MARK: - UITableViewDelegate

extension CoreDataTableView {
    
    func configureCell(cell: UITableViewCell) {  //, withObject product: Products) {
//        cell.textLabel?.text = product.name ?? ""
//        cell.detailTextLabel?.text = String(product.price ?? 0)
    }
//}


}

extension CoreDataTableView {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let sections = fetchedResultsController.sections else { return 0 }
        return sections.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = fetchedResultsController.sections else { return nil }
        return sections[section].indexTitle ?? ""
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else { return 0 }
        return sections[section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        //let product = fetchedResultsController.objectAtIndexPath(indexPath) as! Products
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        //if cell == nil { cell = UITableViewCell(style: .Value1, reuseIdentifier: identifier) }
        //configureCell(cell!, withObject: product)
      //  return cell!
        return cell!
    }
}




// MARK: - NSFetchedResultsControllerDelegate

extension CoreDataTableView: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
        return sectionName
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController<NSFetchRequestResult>, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        
        case .insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .fade)
        
        case .delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .fade)
        
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
        case .update:
            if indexPath != nil {
//                let product = fetchedResultsController.objectAtIndexPath(indexPath) as! Products
//                guard let cell = tableView.cellForRowAtIndexPath(indexPath) else { break }
//                configureCell(cell, withObject: product)
            }
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath as IndexPath], with: .automatic)
            }
       
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            }
       
            
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

