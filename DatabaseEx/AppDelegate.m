//
//  AppDelegate.m
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import "AppDelegate.h"
#import "TabViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

#pragma mark - Data Base

// check the DB
-(void) checkAndCreateDatabase{
	NSFileManager *fileManager = [NSFileManager defaultManager];
    
	// If DBfile doesn't exist
    if (![fileManager fileExistsAtPath:dbPath])
    {
        NSString *dbPathFromApp = [[[NSBundle mainBundle] resourcePath] 
                                   stringByAppendingPathComponent:dbName];
        [fileManager copyItemAtPath:dbPathFromApp toPath:dbPath error:nil];
    }
}

// Get Data from DBfile
-(void) readFilesFromDatabase {

	sqlite3 *database;
    
    // at first read
    if (persons == nil)
        persons = [[NSMutableArray alloc] init];
    // exist already
    else
        [persons removeAllObjects];

    
    // DB File Open
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) 
    {
        // Query
		const char *sqlStatement = "select * from persons";
		sqlite3_stmt *compiledStatement;
	
        // Qeury execute
        if(sqlite3_prepare_v2(database, sqlStatement, -1, 
                              &compiledStatement, NULL) == SQLITE_OK)
        {
            // process while row exists
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) 
            {
				NSString *name = 
                [NSString stringWithUTF8String:
                 (char*)sqlite3_column_text(compiledStatement, 1)];
                
                NSString *telno = 
                [NSString stringWithUTF8String:
                 (char*)sqlite3_column_text(compiledStatement, 2)];
                
                NSString *email = 
                [NSString stringWithUTF8String:
                 (char*)sqlite3_column_text(compiledStatement, 3)];
                
                // create the PersonData
                PersonData *person = 
                [[PersonData alloc] initWithName:name 
                                     phoneNumber:telno 
                                        mailAddr:email];
                // save the PersonData
				[persons addObject:person];
			}
		}
		sqlite3_finalize(compiledStatement);
	}
	sqlite3_close(database);
}

// data insert
- (void)insertDataWithName:(NSString*)n 
               phoneNumber:(NSString*)p
              emailAddress:(NSString*)e
{
    sqlite3 *database;
    
    // DB File Open
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) 
    {
        NSString *query =[NSString 
                          stringWithFormat:@"insert into persons"
                          "(name, telno, email)"
                          "values ('%@', '%@', '%@')",
                          n, p, e];
    
        char* error = NULL;
        sqlite3_exec(database, [query UTF8String],NULL, 0, &error);
        
        
        if (error) NSLog(@"Error Msg: %s", error);
    }
    sqlite3_close(database);
    [self readFilesFromDatabase];
}

- (void)updateWithName:(NSString*)n 
           phoneNumber:(NSString*)p
          emailAddress:(NSString*)e 
               oldName:(NSString*)on
{
    sqlite3 *database;
    
    
    
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) 
    {
        NSString *query =[NSString 
                          stringWithFormat:@"update persons set "
                          "name = '%@', telno = '%@', email = '%@'"
                          "where name = '%@'",
                          n, p, e, on];
        char* error = NULL;
        sqlite3_exec(database, [query UTF8String],NULL, 0, &error);
        if (error) NSLog(@"Error Msg: %s", error);
    }
    sqlite3_close(database);
    [self readFilesFromDatabase];
}

- (void)deleteDataWithName:(NSString*)n
               phoneNumber:(NSString*)p
              emailAddress:(NSString*)e
                   oldName:(NSString*)on

{
    sqlite3 *database;
    
    // DB File Open
    if(sqlite3_open([dbPath UTF8String], &database)==SQLITE_OK)
    {
        NSString *query = [NSString 
                           stringWithFormat:
                           @"delete from persons where"];
        char* error = NULL;
        sqlite3_exec(database, [query UTF8String],NULL, 0, &error);
        if (error) NSLog(@"Error Msg: %s", error);
    }
    
    [self readFilesFromDatabase];
    sqlite3_close(database);
}
// 저널모드변경
char** query3;
- (void)journalChange:(NSString*)a
{
    sqlite3 *database;
    if(sqlite3_open([dbPath UTF8String], &database)==SQLITE_OK)
    {
        NSString *query = [NSString stringWithFormat: @"PRAGMA journal_mode = '%@'; ",a];
        char* error = NULL;
        sqlite3_exec(database, [query UTF8String],NULL, 0, &error);

        if (error) NSLog(@"Error Msg: %s", error);
    }
    //[self readFilesFromDatabase];
    
    sqlite3_close(database);
}

- (char *)journalGet{
    sqlite3 *database;
    char** query2=NULL;
    if(sqlite3_open([dbPath UTF8String], &database)==SQLITE_OK)
    {
        NSString *query =[NSString stringWithFormat: @"pragma journal_mode;"];
        char* error = NULL;
        int* row=NULL;
        int* col=NULL;
        sqlite3_get_table(database,[query UTF8String],&query2,row,col,&error);
    
    
    if (error) NSLog(@"Error Msg: %s", error);
    }
    
    sqlite3_close(database);
    return query2[1];


}




#pragma mark - App Delegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   // UITabBarController *tabBarController;
   //UIViewController *configVC = [[ConfigViewController alloc] init];
   
    dbName = @"namecard.sql";
    
    // DBfile Directory setting
    NSArray *documentPaths = 
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                        NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    dbPath = [documentsDir stringByAppendingPathComponent:dbName];
    
    // check the DBfile
    [self checkAndCreateDatabase];
    
    // get Data
    [self readFilesFromDatabase];
       
    self.window = [[UIWindow alloc] 
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    TabViewController *TabController =
    [[TabViewController alloc] 
     initWithNibName:@"TabViewController" bundle:nil];
    
    self.navigationController = 
    [[UINavigationController alloc] 
     initWithRootViewController:TabController];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
