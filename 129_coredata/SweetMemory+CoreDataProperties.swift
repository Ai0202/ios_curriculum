//
//  SweetMemory+CoreDataProperties.swift
//  129_coredata
//
//  Created by Atsushi on 2018/06/11.
//  Copyright © 2018年 Atsushi. All rights reserved.
//
//

import Foundation
import CoreData


extension SweetMemory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SweetMemory> {
        return NSFetchRequest<SweetMemory>(entityName: "SweetMemory")
    }

    @NSManaged public var place: String?
    @NSManaged public var date: NSDate?

}
