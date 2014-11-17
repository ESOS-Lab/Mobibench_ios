//
//  TabViewController.m
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import "TabViewController.h"
#include <stdlib.h>
#import "SettingViewController.h"

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "PersonData.h"
#import "SettingViewController.h"
#import "ContentViewController.h"
#import "UIDevice-Hardware.h"

@implementation TabViewController
@synthesize SettingViewController = _SettingViewController;

- (void)reloadData
{
    [self.tableView reloadData];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController *testVC = [[ContentViewController alloc] init];
    UIViewController *otherVC = [[SettingViewController alloc] init];

    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[testVC, otherVC];
   
    testVC.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"First", nil)
                                  image:nil
                                    tag:1];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  

    
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];

    
    [[[self.tabBarController.viewControllers objectAtIndex:0] tabBarItem]setTitle:NSLocalizedString(@"Content", @"comment")];
    [[[self.tabBarController.viewControllers objectAtIndex:1] tabBarItem]setTitle:NSLocalizedString(@"Setting", @"comment")];
    
    
    //
    
   
       [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadData)
                                                 name:@"UpdatedDatabase"
                                               object:nil];
}



@end
