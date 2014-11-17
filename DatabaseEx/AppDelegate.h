//
//  AppDelegate.h
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import <UIKit/UIKit.h>

// 헤더추가
#import <sqlite3.h>
#import "PersonData.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    // DB Name
    NSString        *dbName;
    // DB File Path
    NSString        *dbPath;
    // Information in DB
    NSMutableArray  *persons;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *persons;

// Insert Data
- (void)insertDataWithName:(NSString*)n 
               phoneNumber:(NSString*)p 
              emailAddress:(NSString*)e;

// Update Data
- (void)updateWithName:(NSString*)n 
           phoneNumber:(NSString*)p 
          emailAddress:(NSString*)e 
               oldName:(NSString*)on;
// Delete Data
- (void)deleteDataWithName:(NSString*)n
               phoneNumber:(NSString*)p
              emailAddress:(NSString*)e
                   oldName:(NSString*)on;;
// Journal mode change
- (void)journalChange:(NSString*)a;
- (char *)journalGet;

@end
