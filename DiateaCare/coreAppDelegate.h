//
//  coreAppDelegate.h
//  DiateaCare
//
//  Created by Aitrich on 09/05/13.
//  Copyright (c) 2013 aitrich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface coreAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
