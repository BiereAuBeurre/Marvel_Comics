//
//  StorageService.swift
//  Marvel_Appsolute
//
//  Created by Manon Russo on 17/01/2022.
//

import Foundation
import CoreData

class StorageService {
    //MARK: - properties
    let viewContext: NSManagedObjectContext
    
    //MARK: -methods
    init(persistentContainer: NSPersistentContainer = AppDelegate.persistentContainer) {
        self.viewContext = persistentContainer.viewContext
    }

    func loadRecipes() throws -> [ResultElement] {
        /// CoreData request, returns a comicEntiy object that is converted into comic as soon as it's loaded.
        let fetchRequest: NSFetchRequest<ComicEntity> = ComicEntity.fetchRequest()
        let comicEntities: [ComicEntity]
        do { comicEntities = try viewContext.fetch(fetchRequest) }
        catch { throw error }
        let comics = comicEntities.map { (comicEntity) -> ResultElement in
            return ResultElement(from: comicEntity)
        }
        return comics
    }
    
    func saveRecipe(_ comic: ResultElement) throws {
        let comicEntity = ComicEntity(context: viewContext)
        comicEntity.title = comic.title
        comicEntity.thumbnail =  try? JSONEncoder().encode(comic.thumbnail)
        comicEntity.synopsis = comic.resultDescription
        if viewContext.hasChanges {
            do { try viewContext.save() }
            catch { throw error }
        }
    }

    func deleteRecipe(_ comic: ResultElement) throws {
        let fetchRequest: NSFetchRequest<ComicEntity> = ComicEntity.fetchRequest()
        let predicate = NSPredicate(format: "title == %@", comic.title)
        fetchRequest.predicate = predicate
        let comicEntities: [ComicEntity]

        do { comicEntities = try viewContext.fetch(fetchRequest)
            comicEntities.forEach { (comicEntity) in
                viewContext.delete(comicEntity) }
            /// Save once recipe is deleted.
            try viewContext.save() }
        catch { throw error }
    }
}
